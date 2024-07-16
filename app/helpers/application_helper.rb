module ApplicationHelper
  def default_meta_tags
    {
      site: "人材紹介なら『セールスプロ』",
      title:"<%= yield(:title) | セールスプロ' %>",
      description: "人材紹介なら『セールスプロ』",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      reverse: true,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'),  rel: 'apple-touch-icon' },
      ],
	    canonical: request.original_url  # 優先されるurl

    }
  end
end
