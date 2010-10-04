require File.expand_path('../test_helper', __FILE__)

Html5Helpers::FormTagHelper.install

describe Html5Helpers::FormHelper do

  attr_accessor :subject, :helper, :post

  before do
    self.helper = Class.new do
      include ::Html5Helpers::FormHelper
    end.new
    self.post = Post.new({
      :text => 'some text',
      :short_url => 'http://link.ly/12bc',
      :summary_length => '30',
      :publish_date => Date.new(2004, 6, 15),
      :background_color => '#93f1dc'
    })
  end

  describe '#search_field' do
    before do
      self.subject = helper.search_field(:post, :text, :required => true, :object => post)
    end
    it_must_create_an_input_of_type 'search'
    it_must_create_an_input_with_id 'post_text'
    it_must_create_an_input_with_name 'post[text]'
    it_must_set_the_value_to 'some text'
    it_must_set_the_required_flag
  end

end