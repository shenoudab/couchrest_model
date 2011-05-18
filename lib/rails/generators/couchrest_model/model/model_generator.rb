require 'rails/generators/couchrest_model'

module CouchrestModel
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "property:type property:type#, posfixing with '#' marks attribute to be indexed"
      
      check_class_collision
      
      class_option :timestamps, :type => :boolean, :aliases => "-T", :desc => "Add timestamps created_at and updated_at", :default => false
      class_option :casted, :type => :boolean, :aliases => "-E", :desc => "Casted document", :default => false
      class_option :parent, :type => :string, :aliases => "-P", :desc => "Class name of parent document"
      
      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end
      
      hook_for :test_framework
      
      protected
      
      def parent_class_name
        "CouchRest::Model::Base"
      end
      
      def casted_hash
        "Hash"
      end
    end
  end
end