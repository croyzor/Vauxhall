module Types where
  import qualified Data.Map as M

  type Coord = (Int, Int)

  data Item = Sword | Shield | Potion | Coin | Null

  instance Show Item where
    show Sword = "Sword"
    show Shield = "Shield"
    show Potion = "Potion"
    show Coin = "Coin"
    show Null = "Null"

  data Class = Knight {
                kConst :: Int,
                kStr :: Int,
                kDex :: Int,
                kInt :: Int
               }
               |
               Thief {
                tConst :: Int,
                tStr :: Int,
                tDex :: Int,
                tInt :: Int
               }
               |
               Sub {
                sConst :: Int,
                sStr :: Int,
                sDex :: Int,
                sInt :: Int
               } deriving Eq

  instance Show Class where
    show (Knight _ _ _ _) = "Knight"
    show (Thief _ _ _ _) = "Thief"
    show (Sub _ _ _ _) = "Sub"

  data World = World {
                wHero :: Hero,
                walls :: [String],
                currentLvl :: String,
                tileMap :: M.Map Coord Char,
                wEnemies :: M.Map String [Enemy],
                currEnemies :: [Enemy]
               } deriving Show

  data Enemy = Enemy {
                eCoord :: Coord,
                eOldCoord :: Coord,
                eHealth :: Int
               } deriving (Show, Eq)

  data Hero = Hero {
                hName :: String,
                hCoord :: Coord,
                hOldCoord :: Coord,
                hHealth :: Int,
                hDmg :: Int,
                hExp :: Int,
                hLvl :: Int,
                hClass :: Class,
                items :: [Item],
                hScore :: Int
              } deriving Show

  data Direction = Up | Down | Left | Right | Stay deriving Show

  data Action = OpenDoor | CloseDoor | PickUp | DropItem | Rest | ShowInv | ShowStats | Idle | GoDown | GoUp deriving Show

  data Event = Dir Direction | Exit | PlayerAction Action deriving Show