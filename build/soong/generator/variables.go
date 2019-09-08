package generator

import (
	"fmt"

	"android/soong/android"
)

func cooseExpandVariables(ctx android.ModuleContext, in string) string {
	cooseVars := ctx.Config().VendorConfig("cooseVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if cooseVars.IsSet(name) {
			return cooseVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
