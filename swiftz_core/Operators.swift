//
//  Operators.swift
//  swiftz_core
//
//  Created by Maxwell Swadling on 28/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

/// Compose | 
infix operator • {
associativity right
}

infix operator § {
associativity right
precedence 0
}

infix operator |> {
associativity left
precedence 0
}

infix operator <| {
associativity right
precedence 0
}

// "fmap" like
infix operator <^> {
associativity left
}

// "ap" like
infix operator <*> {
associativity left
}

/// Monadic bind operator, because >>= is already in the standard lib.
infix operator >>- {
associativity left
}

/// "From" for Results.
infix operator !! {
associativity none
}
