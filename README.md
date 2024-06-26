# Boggle

Boggle solver.

![Review](https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/boggle/review.yml)
![Version](https://pursuit.purescript.org/packages/purescript-boggle/badge)
![Quality](https://img.shields.io/codacy/grade/ec080f55abf241a5bc4921f349bf6264)

## Installing

```bash
spago install boggle
```

## Usage

```purs
import Data.Matrix (Matrix(..))
import Data.Word (boggle)

boggle (Matrix [ [ "a", "b" ], [ "c", "d" ] ]) 4

>>> [
  { path: [ { x: 0, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 0 } ], word: "cab" },
  { path: [ { x: 0, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 1 } ], word: "cad" },
  { path: [ { x: 1, y: 0 }, { x: 0, y: 0 }, { x: 1, y: 1 } ], word: "bad" },
  { path: [ { x: 1, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 0 } ], word: "dab" },
]
```

## Documentation

Documentation and more detailed examples are hosted on [Pursuit](https://pursuit.purescript.org/packages/purescript-boggle).

## Tooling

### Dependencies

To install dependencies:

```bash
yarn install
yarn spago install
```

### Tests

To run tests:

```bash
yarn spago test
```

### Documentation

To generate the documentation locally:

```bash
yarn spago docs
```

### Linters

To run linters:

```bash
yarn lint
```

### Formatters

To run formatters:

```bash
yarn format
```

## Contributing

Please read this repository's [Code of Conduct](CODE_OF_CONDUCT.md) which outlines our collaboration standards and the [Changelog](CHANGELOG.md) for details on breaking changes that have been made.

This repository adheres to semantic versioning standards. For more information on semantic versioning visit [SemVer](https://semver.org).

Bump2version is used to version and tag changes. For example:

```bash
bump2version patch
```

### Contributors

- [Joel Lefkowitz](https://github.com/joellefkowitz) - Initial work

## Remarks

Lots of love to the open source community!

<div align='center'>
    <img width=200 height=200 src='https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif' alt='Be kind to your mind' />
    <img width=200 height=200 src='https://media.giphy.com/media/KEAAbQ5clGWJwuJuZB/giphy.gif' alt='Love each other' />
    <img width=200 height=200 src='https://media.giphy.com/media/WRWykrFkxJA6JJuTvc/giphy.gif' alt="It's ok to have a bad day" />
</div>
