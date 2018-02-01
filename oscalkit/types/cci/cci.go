package cci

import (
	"encoding/xml"
	"time"
)

// CCI is the root element type for a CCI List document.  The element contains
// document metadata and CCI items.
type CCI struct {
	XMLName xml.Name `xml:"http://iase.disa.mil/cci cci_list"`

	// Metadata element contains information about the CCI list
	Metadata Metadata `xml:"metadata"`

	// Items element contains the cci_items for this CCI list
	Items []Item `xml:"cci_items"`
}

// Metadata contains document metadata for a CCI List document.
type Metadata struct {
	// Version element contains the version identifier of the CCI List
	Version string `xml:"version"`

	// Publishdate element contains the publication date of this version of the
	// CCI List
	PublishDate date `xml:"publishdate"`
}

type date struct {
	time.Time
}

func (pd *date) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error {
	const shortForm = "2006-01-02"
	var v string
	if err := d.DecodeElement(&v, &start); err != nil {
		return err
	}
	parsedTime, err := time.Parse(shortForm, v)
	if err != nil {
		return err
	}
	*pd = date{parsedTime}
	return nil
}

// Item elements contain information about a specific CCI
type Item struct {
	// ID is the ID number for the CCI item
	ID string `xml:"id,attr"`

	// Status is the current state of a CCI
	Status string `xml:"status"`

	// Publishdate is the date a CCI is added to the CCI List
	PublishDate date `xml:"publishdate"`

	// Contributor is the organization that proposed the CCI for inclusion
	Contributor string `xml:"contributor"`

	// Definition is the narrative IA control statement for this CCI
	Definition string `xml:"definition"`

	// Type is used to distinguish between technical and policy requirements
	Type []string `xml:"type,omitempty"`

	// Parameter is used to identify what a CCI is intended to measure
	Parameter string `xml:"parameter,omitempty"`

	// Notes are used to capture additional information about the CCI
	Notes []string `xml:"note,omitempty"`

	// References are links to source documents for this CCI
	References []Reference `xml:"references,omitempty"`
}

// Reference represent an individual source document referenced for this CCI
type Reference struct {
	// Validated elements provide information concerning CCI validation status
	// with respect to the referenced document
	Validated []Validated `xml:"validated,omitempty"`

	// Creator is the name of the person or organization that created the source
	// document
	Creator string `xml:"creator,attr"`

	// Title is the official title of the source document
	Title string `xml:"title,attr"`

	// Version is the version number of the source document
	Version string `xml:"version,attr"`

	// Location is used to identify where the source document can be located
	Location string `xml:"location,attr,omitempty"`

	// Index identifies the location of the control source within the document
	Index string `xml:"index,attr,omitempty"`
}

// Validated contains information associated with a validation of a CCI with
// respect to a referenced source document
type Validated struct {
	// Notes may provide details of the validation
	Notes []string `xml:"note,omitempty"`

	// Org indicates the organization that provided the validation
	Org string `xml:"org"`

	// Date indicates the date the validation occurred, or the date a document
	// confirming validation was issued
	Date date `xml:"date"`
}
