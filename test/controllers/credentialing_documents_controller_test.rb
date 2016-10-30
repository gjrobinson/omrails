require 'test_helper'

class CredentialingDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credentialing_document = credentialing_documents(:one)
  end

  test "should get index" do
    get credentialing_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_credentialing_document_url
    assert_response :success
  end

  test "should create credentialing_document" do
    assert_difference('CredentialingDocument.count') do
      post credentialing_documents_url, params: { credentialing_document: { content_type: @credentialing_document.content_type, file_contents: @credentialing_document.file_contents, filename: @credentialing_document.filename } }
    end

    assert_redirected_to credentialing_document_url(CredentialingDocument.last)
  end

  test "should show credentialing_document" do
    get credentialing_document_url(@credentialing_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_credentialing_document_url(@credentialing_document)
    assert_response :success
  end

  test "should update credentialing_document" do
    patch credentialing_document_url(@credentialing_document), params: { credentialing_document: { content_type: @credentialing_document.content_type, file_contents: @credentialing_document.file_contents, filename: @credentialing_document.filename } }
    assert_redirected_to credentialing_document_url(@credentialing_document)
  end

  test "should destroy credentialing_document" do
    assert_difference('CredentialingDocument.count', -1) do
      delete credentialing_document_url(@credentialing_document)
    end

    assert_redirected_to credentialing_documents_url
  end
end
