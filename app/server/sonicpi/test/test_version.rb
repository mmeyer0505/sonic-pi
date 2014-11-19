#--
# This file is part of Sonic Pi: http://sonic-pi.net
# Full project source: https://github.com/samaaron/sonic-pi
# License: https://github.com/samaaron/sonic-pi/blob/master/LICENSE.md
#
# Copyright 2013, 2014 by Sam Aaron (http://sam.aaron.name).
# All rights reserved.
#
# Permission is granted for use, copying, modification, distribution,
# and distribution of modified versions of this work as long as this
# notice is included.
#++

require 'test/unit'
require_relative "../lib/sonicpi/note"

module SonicPi
  class VersionTester < Test::Unit::TestCase

    def test_version_init
      v = Version.new(2, 1, 0)
      assert_equal(2, v.major)
      assert_equal(1, v.minor)
      assert_equal(0, v.patch)
    end

    def test_version_init_with_dev
      v = Version.new(2, 1, 0, "RC12")
      assert_equal(2, v.major)
      assert_equal(1, v.minor)
      assert_equal(0, v.patch)
      assert_equal("RC12", v.dev)
    end

    def test_equality
      v1 = Version.new(2, 1, 0, "RC12")
      v2 = Version.new(2, 1, 0, "RC12")
      assert_equal(v1, v2)
    end

    def test_inequality
      v1 = Version.new(2, 1, 0, "RC12")
      v2 = Version.new(2, 1, 0, "RC11")
      v3 = Version.new(2, 1, 1, "RC12")
      v4 = Version.new(1, 1, 0, "RC12")
      assert_not_equal(v1, v2)
      assert_not_equal(v1, v3)
      assert_not_equal(v1, v4)
    end

    def test_less_than
      v1 = Version.new(2, 1, 1)
      v2 = Version.new(2, 1, 0)
      assert_equal(true, v2 < v1)
    end

    def test_greater_than
      v1 = Version.new(2, 1, 1)
      v2 = Version.new(2, 1, 0)
      assert_equal(true, v1 > v2)
    end

    def test_less_than_or_equal_equality
      v1 = Version.new(2, 1, 0, "RC12")
      v2 = Version.new(2, 1, 0, "RC12")
      assert_equal(true, v1 <= v2)
      assert_equal(true, v2 <= v1)
    end

  end
end
