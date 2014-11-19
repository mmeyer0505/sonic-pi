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
$:.unshift File.expand_path("../../../../vendor/osc-ruby/lib", __FILE__)
require 'osc-ruby'

module SonicPi
  class Version
    include Comparable
    attr_reader :major, :minor, :patch, :dev

    def initialize(major, minor, patch, dev=nil)
      @major = major.to_i
      @minor = minor.to_i
      @patch = patch.to_i
      @dev = dev
    end

    def to_s
      if @dev
        "#{@major}.#{@minor}.#{@patch}-#{@dev}"
      else
        if @patch == 0
          "#{@major}.#{@minor}"
        else
          "#{@major}.#{@minor}.#{@patch}"
        end
      end
    end

    def <=>(other)
      if ((other.is_a? Version) &&
          (@major < other.major) or
          ((@major == other.major) && (@minor < other.minor)) or
          ((@major == other.major) && (@minor == other.minor) && (@patch < other.patch)))
        -1
      elsif
        ((other.is_a? Version) &&
        (@major > other.major) or
          ((@major == other.major) && (@minor > other.minor)) or
          ((@major == other.major) && (@minor == other.minor) && (@patch > other.patch)))
        return 1
      elsif ((other.is_a? Version) &&
          (@major == other.major) &&
          (@minor == other.minor) &&
          (@patch == other.patch) &&
          (@dev == other.dev))
        return 0
      else
        return nil
      end
    end

    def inspect
      to_s
    end

    def dev?
      !!@dev
    end
  end
end
