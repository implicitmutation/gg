/*
rm -rf ./test && \
idx-template \
  /home/user/gg/template \
  --output-dir /home/user/gg/test -a '{}'
*/
{pkgs, language ? "js", tos ? "false" ... }: {  
  packages = [
    pkgs.nodejs
    pkgs.go
    pkgs.util-linux
  ];
  bootstrap = ''
    mkdir "$out"
    mkdir "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    cp ${./README.md} "$out"/README.md
    env -C "$out" go mod init genkit
    env -C "$out" npm i -D genkit
    echo $(npx genkit --version)
    env -C "$out" npx genkit init --non-interactive -p other -m googleai
    chmod -R u+w "$out"
  '';
}
