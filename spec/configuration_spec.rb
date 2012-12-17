require 'spec_helper'

describe 'Configuration' do
  it 'should have config as SimplePages' do
    SimplePages.configure do |config|
      config.should be SimplePages
    end
  end

  it 'should have controller_modules config' do
    SimplePages.configure do |config|
      config.controller_modules.should be_a_kind_of Array
    end
  end

  it 'should have helper_modules config' do
    SimplePages.configure do |config|
      config.helper_modules.should be_a_kind_of Array
    end
  end

  it 'should have page_modules config' do
    SimplePages.configure do |config|
      config.page_modules.should be_a_kind_of Array
    end
  end

  it 'should have page_table_name config' do
    SimplePages.configure do |config|
      config.page_table_name.should eq 'simple_pages'
    end
  end

  it 'should have pages_per_page config' do
    SimplePages.configure do |config|
      config.pages_per_page.should eq 30
    end
  end
end
