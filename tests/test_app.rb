require "./bin/app.rb"
require "test/unit"

class TestApp < Test::Unit::TestCase

  def test_document_has_defaults
    doc = Document.new
    assert_equal(doc.interesting, 0)
    assert_equal(doc.funny, 0)
    assert_equal(doc.boring, 0)
  end

  def test_document_can_have_body
    doc = Document.new(body: 'test')
    assert_equal(doc.body.nil?, false)
  end

end
