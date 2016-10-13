if ENV['S3_SECRET_ACCESS_KEY']
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_host_alias] = 's3-us-west-2.amazonaws.com/hsboxscoresnyc-staging'
  Paperclip::Attachment.default_options[:s3_credentials] = {
      bucket: ENV['S3_BUCKET'],
      access_key_id: ENV['S3_ACCESS_KEY_ID'],
      secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION']

    }
  Paperclip::Attachment.default_options[:s3_protocol] = :https
  Paperclip::Attachment.default_options[:url] = 's3-us-west-2.amazonaws.com/hsboxscoresnyc-staging'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
