using SpacefarerService as service from '../../srv/spacefarer-service';
using from '../../db/schema';

annotate service.Spacefarer with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : spacesuitColor,
                Label : 'Spacesuit Color',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'Email',
            },
            {
                $Type : 'UI.DataField',
                Value : originPlanetName,
                Label : 'Original Planet',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Stardust Collection',
            ID : 'StardustCollection',
            Target : 'stardustCollection/@UI.LineItem#StardustCollection',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : spacesuitColor,
            Label : 'Spacesuit Color',
        },
    ],
    UI.HeaderInfo : {
        TypeName : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    },
    UI.SelectionFields : [
        
    ],
);

annotate service.SpacefarerStardust with {
    quantity @Common.Label : 'stardustCollection/quantity'
};

annotate service.SpacefarerStardust with {
    stardustType @Common.Label : 'stardustCollection/stardustType_ID'
};

annotate service.SpacefarerStardust with @(
    UI.LineItem #StardustCollection : [
        {
            $Type : 'UI.DataField',
            Value : spacefarer.stardustCollection.stardustTypeName,
            Label : 'Type',
        },
        {
            $Type : 'UI.DataField',
            Value : spacefarer.stardustCollection.quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : spacefarer.stardustCollection.unit,
            Label : 'Unit',
        },
    ]
);

