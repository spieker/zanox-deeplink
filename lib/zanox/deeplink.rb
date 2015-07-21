require 'mechanize'
require 'zanox/deeplink/version'
require 'zanox/deeplink/generator'

module Zanox
  module Deeplink
    DefaultConfig = Struct.new(:username, :password, :adspace)

    def self.configure
      @config = DefaultConfig.new
      yield(@config) if block_given?
      @config
    end

    def self.config
      @config || configure
    end
  end

  def self.deeplink(url, options = {})
    options.reverse_merge!(
      adspace: Deeplink.config.adspace
    )
    generator = Deeplink::Generator.new
    generator.login Deeplink.config.username, Deeplink.config.password
    generator.deeplink url, options
  end
end
