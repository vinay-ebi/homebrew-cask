#Template generated on 2018-08-09 13:55:02 +0100
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class WebGui < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the WebGui formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '5'

  depends_on 'libgd'
  depends_on 'imagemagick'
  depends_on 'pngcrush'
  depends_on 'ensembl/ensembl/zopfli'
  depends_on 'libsass'
  depends_on 'sassc'
  depends_on 'ensembl/web/graphviz'
  depends_on 'ensembl/web/coffeescript'
  depends_on 'babel'

  def install
    File.open('web-gui', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'web-gui'
  end
end
    