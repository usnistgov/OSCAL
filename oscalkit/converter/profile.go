package converter

import (
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/profile"
)

// ProfileToJSON ...
func ProfileToJSON(p *profile.ProfileXML) *profile.ProfileJSON {
	profileJSON := &profile.ProfileJSON{
		ID:      p.Invoke.ID,
		Invoke:  p.Invoke.Href,
		Include: make([]profile.IncludeJSON, len(p.Invoke.Include)),
	}

	for i, include := range p.Invoke.Include {
		profileJSON.Include[i] = profile.IncludeJSON{
			All:             include.All != nil,
			WithSubcontrols: include.All != nil && include.All.WithSubcontrols == "yes",
			Calls:           make([]profile.CallJSON, len(include.Call)),
			Params:          make([]profile.ParamJSON, len(include.Param)),
		}

		for c, call := range include.Call {
			profileJSON.Include[i].Calls[c] = profile.CallJSON{
				ControlID:    call.ControlID,
				SubcontrolID: call.SubcontrolID,
			}
		}

		for p, param := range include.Param {
			profileJSON.Include[i].Params[p] = profile.ParamJSON{
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

	for _, exclude := range p.Invoke.Exclude {
		for c, call := range exclude.Call {
			profileJSON.Exclude[c].ControlID = call.ControlID
			profileJSON.Exclude[c].SubcontrolID = call.SubcontrolID
		}
	}

	return profileJSON
}
