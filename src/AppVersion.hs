{- |
Copyright: (c) 2020 Kowainik
SPDX-License-Identifier: MPL-2.0
Maintainer: Kowainik <xrom.xkov@gmail.com>

Get your application version
-}

module AppVersion
    ( getGitInfo
    ) where

import Control.Exception (throwIO)

import qualified GitHash as Git


{- | Extract 'Git.GitInfo' about the current repository.
-}
getGitInfo :: IO Git.GitInfo
getGitInfo = Git.getGitRoot "." >>= \case
    Left err -> throwIO err
    Right root -> Git.getGitInfo root >>= \case
        Left err -> throwIO err
        Right info -> pure info
