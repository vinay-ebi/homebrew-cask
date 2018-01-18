#Template generated on 2018-01-18 15:01:42 +0000
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class ProductionInfrastructure < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the ProductionInfrastructure formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '6'

  depends_on 'erlang'
  depends_on 'homebrew/nginx/nginx-full' => ["with-http_sub_module"]

  def install
    File.open('production-infrastructure', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'production-infrastructure'
  end
end
    