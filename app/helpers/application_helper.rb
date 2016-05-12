module ApplicationHelper
  def default_meta_tags
  {
    site: 'すきつら',
    reverse: true,
    separator: '-',
    title: '',
    charset: 'utf-8',

    og: {
      title: :title,
      type: "website",
      url: request.original_url,
      image: 'image_url(Settings.site.meta.ogp.image_path)',
      site_name: '好きすぎて辛い想い共有アプリ「すきつら」',
      description: :description,
      locale: 'ja_JP'
    }
  }
  end



end





