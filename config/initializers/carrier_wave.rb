CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIA3XQX4GDUOFCAJBPK',                        # required unless using use_iam_profile
      aws_secret_access_key: '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',                        # required unless using use_iam_profile
    }
    config.fog_directory  = 'ronypetsproducts'                                      # required
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file
  end