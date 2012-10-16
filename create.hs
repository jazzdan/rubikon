import System.IO
import Control.Monad

main = do
  let file = "derp.txt"
  h <- openFile file WriteMode
  hPrint h [1,2,3]
  hClose h

  h <- openFile file ReadMode
  contents <- readFile file
  putStrLn contents
