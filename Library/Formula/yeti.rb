require 'formula'

class Yeti < Formula
  homepage 'http://mth.github.com/yeti/'
  url 'https://github.com/mth/yeti/tarball/v0.9.4'
  md5 'f84448ae15e2b0064f4fc8f24d492b64'

  head 'https://github.com/mth/yeti.git'

  def install
    system "ant jar"

    prefix.install "yeti.jar"
    (bin+'yeti').write <<-EOS.undent
      #!/bin/sh
      YETI=#{prefix}/yeti.jar
      java -server -jar "$YETI" "$@"
      EOS
  end
end
