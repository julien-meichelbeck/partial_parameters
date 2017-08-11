require 'test_helper'
require 'partial_parameters/action_view/helpers'

class PartialParametersTest < Minitest::Test
  include PartialParameters::ActionView::Helpers

  def test_no_check_in_production
    skip
    ENV['RAILS_ENV'] = 'production'
    partial_parameters { required(:foo) }
  ensure
    ENV['RAILS_ENV'] = 'test'
  end

  def test_check_block_presence
    e = assert_raises do
      partial_parameters
    end
    assert e.is_a?(NoBlockGivenError)
  end

  def test_check_local_assigns_variable_presence
    e = assert_raises do
      partial_parameters {  }
    end
    assert e.is_a?(InvalidContextError)
  end

  def test_block_is_executed
    local_assigns = {}
    a = false
    partial_parameters { a = true }
    assert a
  end

  def test_missing_optional_parameter_does_not_raise
    local_assigns = {}
    partial_parameters { optional(:foo) }
  end

  def test_present_optional_parameter_does_not_raise
    local_assigns = {foo: 1}
    partial_parameters { optional(:foo) }
  end

  def test_missing_required_parameter_raises
    local_assigns = { foo: 1 }
    e = assert_raises do
      partial_parameters { required(:bar) }
    end
    assert e.is_a?(MissingParameterError)
    assert_equal 'Missing required parameter bar.', e.message
  end

  def test_present_required_parameter_does_not_raise
    local_assigns = { bar: 1 }
    partial_parameters { required(:bar) }
  end

  def test_unknown_parameter_in_strict_mode_raises
    local_assigns = { bar: 1 }
    e = assert_raises do
      partial_parameters { }
    end
    assert e.is_a?(UnknownParametersError)
    assert_equal 'Unknown parameters: [:bar]', e.message
  end

  def test_unknown_parameter_in_non_strict_mode_does_not_raise
    local_assigns = { bar: 1 }
    partial_parameters(strict: false) { optional(:foo) }
  end
end
