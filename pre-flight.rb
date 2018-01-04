#Template generated on 2018-01-04 13:27:39 +0000
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class PreFlight < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the PreFlight formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '2'

  depends_on 'berkeley-db'

  def install
    File.open('pre-flight', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'pre-flight'
  end
end
    