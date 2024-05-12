# NvChad Customization 

This repository builds a docker image of NvChad -- a customization of Neo Vim. 

You have all of NvChad with the addition of severals plugins and configurations to:

- Develop in Haskell (language server) 
- Write markdown documents (language server) 
- Write, compile, and visualize Latex documents (`<leader> cl`)
- Manage repositories and commits (Lazygit, `<leager gg>`)
- Welcome screen of DPella (the company where I work)

It also supports: 

- keeping tracks of comments of the form `TODO:`, `HACK:`, and `BUG:` (`]t` and
  `[t` for next an prev comment)
- save and restore sessions (`<leader> z`)

All of the docker images will have a volume associated with it and mounted in `/vol`.
This is the directory where you should put all your persisten data.

# Configuration 

## SSH Keys:

Once you clone this repo, you should get into `ssh` and add your private /
public keys to connect to Github or Bitbucket.

File `key` is the private key file which is **not** passphrase protected. File
`key.pub` is your public key.

## To create a key

Run the following command inside the `ssh` directory, and just press enter when asked for a password.

```bash
ssh-keygen -t ed25519 -C <your_email> -f ./key
```
Don't forget to upload the public keys to Github or Bitbucket. 

# Launch 

```bash
./launch neo-h
```

If the image does not exist, it will create it and launch the container. If the image exits, 
it will launch it inside a container. 

After the image is launched, simply type

```bash 
docker attach <4 first letters of the container created>
```

Once inside the container, type 

```bash 
nvim 
```

Enjoy! 
