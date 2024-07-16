class ContractsController < ApplicationController
    before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy, :send_mail]
  
    def index
      @contracts = Contract.order(created_at: "DESC").page(params[:page])
    end
  
    def new
      @contract = Contract.new
    end
  
    def confirm
      @contract = Contract.new(contract_params)
    end
  
    def thanks
      @contract = Contract.new(contract_params)
      @contract.save
      if admin_signed_in?
        ContractMailer.received_email(@contract).deliver # 管理者に通知
        flash[:notice] = "管理者送信のため、取引先にはメールを送らず完了しました。"
      else
        # 一般ユーザーの場合はメール送信を行う
        ContractMailer.received_email(@contract).deliver # 管理者に通知
        ContractMailer.send_email(@contract).deliver # 送信者に通知
      end
    end
  
    def create
      @contract = Contract.new(contract_params)
      @contract.save
      redirect_to thanks_contracts_path
    end
  
    def show
      @contract = Contract.find(params[:id])
      @comment = Comment.new
    end
  
    def edit
      @contract = Contract.find(params[:id])
    end

    def info
      @contract = Contract.find(params[:id])
    end
  
    def conclusion
      @contract = Contract.find(params[:id])
      today = Date.today.strftime("%Y-%m-%d")
    end

    def destroy
      @contract = Contract.find(params[:id])
      @contract.destroy
      redirect_to contracts_path, alert:"削除しました"
    end

    def send_mail
      @contract = Contract.find(params[:id])
      ContractMailer.received_first_email(@contract).deliver_now
      ContractMailer.send_first_email(@contract).deliver_now
      redirect_to info_contract_path(@contract), notice: "#{@contract.co}へ契約依頼のメール送信を行いました。"
    end
  
    def update
      @contract = Contract.find(params[:id])
    
      if @contract.update(contract_params)
        if @contract.agree == "同意しました"
            # メール送信処理
            ContractMailer.contract_received_email(@contract).deliver_now
            ContractMailer.contract_send_email(@contract).deliver_now
            flash[:notice] = "契約が完了しました"
            redirect_to info_contract_path(@contract)
          # edit.html.slimからの送信、またはconclusion.html.slimからの送信でも同意が得られなかった場合
        else
          redirect_to info_contract_path(@contract)
        end
      else
        # 更新が失敗した場合の処理
        render :edit
      end
    end
  
    private
    def contract_params
      params.require(:contract).permit(
        :agree, #同意
        :co, #会社名
        :president_first,  #代表者姓
        :president_last,  #代表者名
        :tel, #電話番号
        :address, #ご住所住所
        :email, #メールアドレス
        :url, #会社HP
        :recruit_url, #採用ページ
        :recruit_url_2, #採用ページ
        :work, #採用予定職種
        :plan, #ご利用プラン選択
        :number, #採用予定人数
        :period, #希望採用予定
        :remarks, #その他要望
        :person_first,  #採用担当姓
        :person_last,  #採用担当名
        :person_tel, #採用担当携帯番号
        :post_title,
        :contract_date,
        :unit_price,
        :refund, 
      )
    end
end
