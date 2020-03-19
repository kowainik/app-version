{- |
Copyright: (c) 2020 Kowainik
SPDX-License-Identifier: MPL-2.0
Maintainer: Kowainik <xrom.xkov@gmail.com>

Get your application version
-}

module AppVersion
    ( getGitInfo
    ) where

import qualified GitHash as Git


{- | Extract 'Git.GitInfo' about the current repository or return
'Git.GitHashException' in case of any failures.
-}
getGitInfo :: IO (Either Git.GitHashException Git.GitInfo)
getGitInfo = Git.getGitRoot "." >>= \case
    Left err -> pure $ Left err
    Right root -> Git.getGitInfo root
