// +build tools

// Why?
// https://github.com/golang/go/wiki/Modules/6ae647c7e344bc643f9ab7478e9cdd77b8795f72#how-can-i-track-tool-dependencies-for-a-module)
// https://github.com/golang/go/issues/25922#issuecomment-412992431
// https://github.com/go-modules-by-example/tools/commit/2b180f37cec267e315f0ea5eda249e5b8e789724

package tools

import (
	_ "github.com/gohugoio/hugo"
)