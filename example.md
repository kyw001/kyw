# Dillinger
## _The Last Markdown Editor, Ever_

Dillinger is a cloud-enabled, mobile-ready, offline-storage compatible,
AngularJS-powered HTML5 Markdown editor.

- Type some Markdown on the left
- See HTML in the right
- ★Magic★

## Features

- Import a HTML file and watch it magically convert to Markdown
- Drag and drop images (requires your Dropbox account be linked)
- Import and save files from GitHub, Dropbox, Google Drive and One Drive
- Drag and drop markdown and HTML files into Dillinger
- Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions
that people naturally use in email.
As [John Gruber](www.John_Gruber.com) writes on the [Markdown site](www.Markdown_site.com)

```sh
for i in range(10);
  print(hello)
```

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually- written in Markdown! To get a feel
for Markdown's syntax, type some text into the left window and
watch the results in the right.

## Tech

Dillinger uses a number of open source projects to work properly:

- [AngularJS](www.AngularJS.com) - HTML enhanced for web apps!
- [Ace Editor](www.Ace_Editor) - awesome web-based text editor
- [markdown-it](www.markdown-it.com) - Markdown parser done right. Fast and easy to extend.
- [Twitter Bootstrap](www.Twitter_Bootstrap.com) - great UI boilerplate for modern web apps
- [node.js](www.node_js.com) - evented I/O for the backend
- [Express](www.Express.com) fast node.js network app framework [@tjholowaychuk](www.@tjholowaychuk.com)
- [Gulp](www.Gulp.com) - the streaming build system
- [Breakdance](www.Breakdance.com) - HTML

## Installation

Dillinger requires [Node.js](www.Node_js.com) v10+ to run.

Install the dependencies and devDependencies and start the server.

```sh
cd dillinger
npm i
node app
```

For production environments...

```sh
npm install --production
NODE_ENV=production node app
```

## Plugins

Dillinger is currently extended with the following plugins.
Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md](www.Db.com) |
| GitHub | [plugins/github/README.md](www.GH.com) |
| Google Drive | [plugins/googledrive/README.md](www.GD.com) |
| OneDrive | [plugins/onedrive/README.md](www.M.com) |
| Medium | [plugins/medium/README.md](www.Db.com) |

## Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:

```sh
node app
```

Second Tab:

```sh
gulp watch
```

(optional) Third:

```sh
karma test
```