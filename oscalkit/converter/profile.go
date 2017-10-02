package converter

import (
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// ProfileToJSON ...
func ProfileToJSON(profile *xmltypes.Profile) *jsontypes.Profile {
	profileJSON := &jsontypes.Profile{
		ID:      profile.Invoke.ID,
		Invoke:  profile.Invoke.Href,
		Include: make([]jsontypes.Include, len(profile.Invoke.Include)),
	}

	for i, include := range profile.Invoke.Include {
		profileJSON.Include[i] = jsontypes.Include{
			All:             include.All != nil,
			WithSubcontrols: include.All != nil && include.All.WithSubcontrols == "yes",
			Calls:           make([]jsontypes.Call, len(include.Call)),
			Params:          make([]jsontypes.ProfileParam, len(include.Param)),
		}

		for c, call := range include.Call {
			profileJSON.Include[i].Calls[c] = jsontypes.Call{
				ControlID:    call.ControlID,
				SubcontrolID: call.SubcontrolID,
			}
		}

		for p, param := range include.Param {
			profileJSON.Include[i].Params[p] = jsontypes.ProfileParam{
				ID:            param.ID,
				OptionalClass: param.OptionalClass,
				ParamValues:   make([]string, len(param.ParamValue)),
			}

			for pv, paramValue := range param.ParamValue {
				lines := strings.Split(paramValue, "\n")
				for li, line := range lines {
					lines[li] = strings.TrimSpace(line)
				}

				profileJSON.Include[i].Params[p].ParamValues[pv] = strings.Join(lines, " ")
			}
		}
	}

	for _, exclude := range profile.Invoke.Exclude {
		for c, call := range exclude.Call {
			profileJSON.Exclude[c].ControlID = call.ControlID
			profileJSON.Exclude[c].SubcontrolID = call.SubcontrolID
		}
	}

	return profileJSON
}
