# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Corrs < Formula
  desc "Corrs Server for connecting and dealing with corr servers"
  homepage "https://github.com/atmaramnaik/corr"
  url "https://github.com/atmnk/corr/releases/download/v0.0.26/corrs.tar.gz"
  sha256 "6aafe6b672e52408001ea9ce739cfbe575e7e4ff8af2b70ff4f09d962d1e1b16"
  version "0.0.26"
    
  def install
    bin.install "corrs"
    sd.mkpath
    sd.install "index.html"
    (buildpath/"corrs.toml").write <<~EOS
      wroot = "#{opt_prefix}/static"
    EOS
    etc.install "corrs.toml"
  end
  def sd
    return prefix/"static"
  end
  def plist
      <<~EOS
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
            <dict>
                <key>KeepAlive</key>
                <true/>
                <key>Label</key>
                <string>#{plist_name}</string>
                <key>ProgramArguments</key>
                <array>
                    <string>#{opt_bin}/corrs</string>
                </array>
                <key>RunAtLoad</key>
                <true/>
                <key>StandardErrorPath</key>
                <string>/dev/null</string>
                <key>StandardOutPath</key>
                <string>/dev/null</string>
            </dict>
        </plist>
      EOS
    end
end
