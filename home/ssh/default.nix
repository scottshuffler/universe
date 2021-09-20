{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host herq
        HostName 192.168.1.226
        User shimmerjs
      
      Host edge-dev
        HostName 192.168.122.125
        User shimmerjs
        ProxyJump herq
        UserKnownHostsFile /dev/null
        StrictHostKeyChecking no
        PasswordAuthentication no
        IdentityFile /home/shimmerjs/.ssh/edge-dev
        IdentitiesOnly yes
        LogLevel FATAL
    '';
  };
}
