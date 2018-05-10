module Web.HTML.HTMLElement
  ( HTMLElement
  , toElement
  , toParentNode
  , toNonDocumentTypeChildNode
  , toNode
  , toEventTarget
  , read
  , title
  , setTitle
  , lang
  , setLang
  , dir
  , setDir
  , className
  , setClassName
  , classList
  , hidden
  , setHidden
  , tabIndex
  , setTabIndex
  , draggable
  , setDraggable
  , contentEditable
  , setContentEditable
  , isContentEditable
  , spellcheck
  , setSpellcheck
  , click
  , focus
  , blur
  , getBoundingClientRect
  , DOMRect
  , offsetParent
  , offsetTop
  , offsetLeft
  , offsetWidth
  , offsetHeight
  ) where

import Prelude

import Control.Monad.Except (except)
import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Foreign (F, Foreign, ForeignError(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.DOMTokenList (DOMTokenList)
import Web.DOM.Element (Element)
import Web.DOM.Internal.Types (Node)
import Web.DOM.NonDocumentTypeChildNode (NonDocumentTypeChildNode)
import Web.DOM.ParentNode (ParentNode)
import Web.Event.Types (EventTarget)

foreign import data HTMLElement :: Type

toElement :: HTMLElement -> Element
toElement = unsafeCoerce

toParentNode :: HTMLElement -> ParentNode
toParentNode = unsafeCoerce

toNonDocumentTypeChildNode :: HTMLElement -> NonDocumentTypeChildNode
toNonDocumentTypeChildNode = unsafeCoerce

toNode :: HTMLElement -> Node
toNode = unsafeCoerce

toEventTarget :: HTMLElement -> EventTarget
toEventTarget = unsafeCoerce

foreign import _read
  :: (forall a. String -> F a)
  -> (forall a. a -> F a)
  -> Foreign
  -> F HTMLElement

read :: Foreign -> F HTMLElement
read = _read (except <<< Left <<< pure <<< TypeMismatch "HTMLElement") (except <<< Right)

foreign import title :: HTMLElement -> Effect String
foreign import setTitle :: String -> HTMLElement -> Effect Unit

foreign import lang :: HTMLElement -> Effect String
foreign import setLang :: String -> HTMLElement -> Effect Unit

foreign import dir :: HTMLElement -> Effect String
foreign import setDir :: String -> HTMLElement -> Effect Unit

foreign import className :: HTMLElement -> Effect String
foreign import setClassName :: String -> HTMLElement -> Effect Unit

foreign import classList :: HTMLElement -> Effect DOMTokenList

foreign import hidden :: HTMLElement -> Effect Boolean
foreign import setHidden :: Boolean -> HTMLElement -> Effect Unit

foreign import tabIndex :: HTMLElement -> Effect Int
foreign import setTabIndex :: Int -> HTMLElement -> Effect Unit

foreign import draggable :: HTMLElement -> Effect Boolean
foreign import setDraggable :: Boolean -> HTMLElement -> Effect Unit

foreign import contentEditable :: HTMLElement -> Effect String
foreign import setContentEditable :: String -> HTMLElement -> Effect Unit
foreign import isContentEditable :: HTMLElement -> Effect Boolean

foreign import spellcheck :: HTMLElement -> Effect Boolean
foreign import setSpellcheck :: Boolean -> HTMLElement -> Effect Unit

foreign import click :: HTMLElement -> Effect Unit
foreign import focus :: HTMLElement -> Effect Unit
foreign import blur :: HTMLElement -> Effect Unit

type DOMRect =
  { top :: Number
  , right :: Number
  , bottom :: Number
  , left :: Number
  , width :: Number
  , height :: Number
  }

foreign import getBoundingClientRect :: HTMLElement -> Effect DOMRect

foreign import _offsetParent :: HTMLElement -> Effect (Nullable Element)

offsetParent :: HTMLElement -> Effect (Maybe Element)
offsetParent = map toMaybe <<< _offsetParent

foreign import offsetTop :: HTMLElement -> Effect Number
foreign import offsetLeft :: HTMLElement -> Effect Number
foreign import offsetWidth :: HTMLElement -> Effect Number
foreign import offsetHeight :: HTMLElement -> Effect Number
