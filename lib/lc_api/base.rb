module LcApi
  class Base < ActiveResource::Base
    self.site = "http://api.lifechurch.tv/v1"

    class << self
      attr_accessor :api_key
    end

    def self.find(*args)
      scope   = args.slice!(0)
      options = args.slice!(0) || {}

      options[:params] = (options[:params] || {}).merge({include: options[:include].join(",")}) if options.has_key? :include
      options[:params] = (options[:params] || {}).merge({type: options[:type]}) if options.has_key? :type
      options[:params] = (options[:params] || {}).merge({key: LcApi.key})

      super(scope, options)
    end
  end
end