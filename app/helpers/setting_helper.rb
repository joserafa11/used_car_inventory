module SettingHelper
  
  module ClassMethods
    @singleton = nil
    def instance
      if @singleton.nil?
        @singleton = new
      end
      @singleton
    end
  end

  def create_method( name, &block )
    self.class.send( :define_method, name, &block )
  end

  def create_attr( name )
    create_method( "#{name}=".to_sym ) { |val|
      instance_variable_set( "@" + name, val)
    }

    create_method( name.to_sym ) {
      instance_variable_get( "@" + name )
    }
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end

end