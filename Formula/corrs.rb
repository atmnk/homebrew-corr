class Corrs < Formula
  desc "Server for connecting and dealing with corr servers"
  homepage "https://github.com/atmaramnaik/corr"
  url "https://github.com/atmnk/corr/releases/download/v0.1.11/corrs.tar.gz"
  version "0.1.11"
  sha256 "de158c796f56ca8a92f8413e86d5bf758310a5225b7398db04498fc3663423c5"  
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
