------------------------------------------------------------------------
-- The Agda standard library
--
-- Convenient syntax for equational reasoning
------------------------------------------------------------------------

-- Example use:

-- n*0≡0 : ∀ n → n * 0 ≡ 0
-- n*0≡0 zero    = refl
-- n*0≡0 (suc n) =
--   begin
--     suc n * 0
--   ≈⟨ refl ⟩
--     n * 0 + 0
--   ≈⟨ ... ⟩
--     n * 0
--   ≈⟨ n*0≡0 n ⟩
--     0
--   ∎

-- Module ≡-Reasoning in Relation.Binary.PropositionalEquality
-- is recommended for equational reasoning when the underlying equality is
-- Relation.Binary.PropositionalEquality._≡_.

{-# OPTIONS --without-K --safe #-}

open import Relation.Binary

module Relation.Binary.Reasoning.Setoid {s₁ s₂} (S : Setoid s₁ s₂) where

open Setoid S
open import Relation.Binary.Reasoning.Preorder preorder public
  hiding (_≈⟨_⟩_)
  renaming
  ( _∼⟨_⟩_  to _≈⟨_⟩_
  ; _≈⟨⟩_   to _≡⟨⟩_
  )
