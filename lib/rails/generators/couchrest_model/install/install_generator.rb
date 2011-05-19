# encoding: utf-8
require 'rails/generators/couchrest_model'

module CouchrestModel
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a CouchrestModel initializer and configuration files"
        
      argument :database_name, :type => :string, :optional => true
        
      class_option :orm
        
      def self.source_root
        @_couchrest_model_source_root ||= File.expand_path("../templates", __FILE__)
      end
        
      def app_name
        Rails::Application.subclasses.first.parent.to_s.underscore
      end
      
      def copy_initializer
        template "couchdb.rb", "config/initializers/couchdb.rb"
      end

      def create_config_file
        template 'couchdb.yml', File.join('config', "couchdb.yml")
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end