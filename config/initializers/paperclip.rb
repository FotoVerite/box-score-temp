credentials = Rails.application.credentials[Rails.env.to_sym]
if credentials[:s3_access_key_id]
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_host_name] = credentials[:s3_host_name]
  Paperclip::Attachment.default_options[:s3_credentials] = {
      bucket: credentials[:s3_bucket],
      access_key_id: credentials[:s3_access_key_id],
      secret_access_key: credentials[:s3_secret_access_key],
      s3_region: credentials[:s3_region]
    }
  Paperclip::Attachment.default_options[:s3_protocol] = :https
  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
