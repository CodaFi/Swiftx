//
//  Bifunctor.swift
//  swiftz
//
//  Created by Robert Widmann on 7/25/14.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

import Foundation

public class P<A, B> {
  public init() {
    
  }
}

public protocol Bifunctor {
  typealias A
  typealias B
  typealias C
  typealias D
  typealias PAC = P<A, C>
  typealias PAB = P<A, B>
  typealias PBC = P<B, C>
  typealias PBD = P<B, D>

  func bimap(f: (A -> B), g: (C -> D)) -> PBD
}
//
//func leftMap<A, B, C, PAB : Bifunctor, R : Bifunctor>(f : (A -> B), x: PAB) -> R {
//  return x.bimap(f, g: identity)
//}
//
//func rightMap<A, B, C, PAB : Bifunctor, PAC : Bifunctor>(f : (A -> B), x: PAB) -> PAC {
//  return x.bimap(identity, g: f)
//}

public struct ConstBF<A, B, C, D>: Bifunctor {
  public let c: Const<A, C>
  
  public init(c: Const<A, C>) {
    self.c = c
  }
  
  public func bimap(f: (A -> B), g: (C -> D)) -> Const<B, D> {
    return Const(f(c.runConst()))
  }
}

public struct EitherBF<A, B, C, D>: Bifunctor {
  public let e: Either<A, C>
  
  public init(e: Either<A, C>) {
    self.e = e
  }
  
  public func bimap(f: (A -> B), g: (C -> D)) -> Either<B, D> {
    switch e {
      case .Left(let bx): return Either.Left(Box<B>(f(bx.value)))
      case .Right(let bx): return Either.Right(Box<D>(g(bx.value)))
    }
  }
}

public struct TupleBF<A, B, C, D>: Bifunctor {
  public let t: (A, C)
  
  public init(t: (A, C)) {
    self.t = t
  }
  
  public func bimap(f: (A -> B), g: (C -> D)) -> (B, D) {
    return (f(t.0), g(t.1))
  }
}
