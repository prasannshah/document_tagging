require 'test_helper'

class DocumentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_tag = document_tags(:one)
  end

  test "should get index" do
    get document_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_document_tag_url
    assert_response :success
  end

  test "should create document_tag" do
    assert_difference('DocumentTag.count') do
      post document_tags_url, params: { document_tag: {  } }
    end

    assert_redirected_to document_tag_url(DocumentTag.last)
  end

  test "should show document_tag" do
    get document_tag_url(@document_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_tag_url(@document_tag)
    assert_response :success
  end

  test "should update document_tag" do
    patch document_tag_url(@document_tag), params: { document_tag: {  } }
    assert_redirected_to document_tag_url(@document_tag)
  end

  test "should destroy document_tag" do
    assert_difference('DocumentTag.count', -1) do
      delete document_tag_url(@document_tag)
    end

    assert_redirected_to document_tags_url
  end
end
