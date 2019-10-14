#Template generated on 2019-10-14 12:42:01 +0100
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class ComparaNcrnatrees < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the ComparaNcrnatrees formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '6'

  depends_on 'ensembl/external/infernal'
  depends_on 'ensembl/external/mafft'
  depends_on 'ensembl/ensembl/treebest'
  depends_on 'ensembl/external/quicktree'
  depends_on 'ensembl/ensembl/ktreedist'
  depends_on 'ensembl/external/fasttree'
  depends_on 'ensembl/ensembl/cafe'
  depends_on 'ensembl/external/prank'
  depends_on 'ensembl/ensembl/r2r'
  depends_on 'ensembl/ensembl/parsimonator'
  depends_on 'ensembl/ensembl/raxml'
  depends_on 'ensembl/ensembl/examl'

  def install
    File.open('compara-ncrnatrees', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'compara-ncrnatrees'
  end
end
    