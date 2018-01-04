#Template generated on 2018-01-04 13:27:47 +0000
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class BasicDependencies < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the BasicDependencies formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '9'

  depends_on 'git'
  depends_on 'autoconf'
  depends_on 'ack'
  depends_on 'jdk@8'
  depends_on 'bzip2'
  depends_on 'readline'
  depends_on 'sqlite'
  depends_on 'gdbm' => ["with-libgdbm-compat"]
  depends_on 'ant'
  depends_on 'maven'
  depends_on 'open-mpi' => ["with-mpi-thread-multiple", "with-cxx-bindings", "c++11"]

  def install
    File.open('basic-dependencies', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'basic-dependencies'
  end
end
    