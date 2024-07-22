class ContractMailer < ActionMailer::Base
  default from: "info@sale-s.pro"
  def received_email(contract)
    @contract = contract
    mail to: "info@sale-s.pro"
    mail cc: "kamon@ri-plus.jp"
    mail(subject: '株式会社セールスプロにお問い合わせがありました') do |format|
      format.text
    end
  end

  def send_email(contract)
    @contract = contract
    mail to: contract.email
    mail(subject: '株式会社セールスプロにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def contract_received_email(contract)
    @contract = contract
    mail to: "info@sale-s.pro"
    mail(subject: 'セールスプロ約款へ同意いただきありがとうございました。') do |format|
      format.text
    end
  end

  def contract_send_email(contract)
    @contract = contract
    mail to: contract.email
    mail(subject: 'セールスプロ約款へ同意いただきありがとうございました。') do |format|
      format.text
    end
  end

  def received_first_email(contract)
    @contract = contract
    @contract_url = "https://sale-s.pro/contracts/#{contract.id}"
    mail(to: "okuyama@sale-s.pro", subject: "【#{@contract.co}】契約発行通知")
  end

  def send_first_email(contract)
    @contract = contract
    @contract_url = "https://sale-s.pro/contracts/#{contract.id}"
    mail(from:"info@sale-s.pro", to: @contract.email, subject: "契約締結のご案内")
  end

  def new_comment_notification(comment)
    @comment = comment
    @contract = comment.contract
    @contract_url = "https://sale-s.pro/contracts/#{@contract.id}"
    mail to: "reply@ri-plus.jp"
    mail(subject: "#{@contract.co}のステータスが#{@comment.status}に更新されました") do |format|
      format.text
    end
  end


end
