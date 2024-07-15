/*
rm -rf ./test && \
idx-template \
  /home/user/gg/template \
  --output-dir /home/user/gg/test -a '{}'
*/
{pkgs, ... }: {  
  packages = [
    pkgs.nodejs
  ];
  bootstrap = ''
    mkdir "$out"
    mkdir "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    cp ${./README.md} "$out"/README.md
    npm i -D genkit
    npx genkit init --non-interactive -p other -m googleai
    chmod -R u+w "$out"
  '';
}
