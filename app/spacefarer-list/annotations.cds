using SpacefarerService as service from '../../srv/spacefarer-service';
using from '../../db/schema';

annotate service.Spacefarer with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'spacesuitColorCode',
                Value : spacesuitColorCode,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'spacesuitColorCode',
            Value : spacesuitColorCode,
        },
    ],
    UI.HeaderInfo : {
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.SelectionFields : [
        stardustCollection.quantity,
        stardustCollection.stardustType_ID,
    ],
);

annotate service.SpacefarerStardust with {
    quantity @Common.Label : 'stardustCollection/quantity'
};

annotate service.SpacefarerStardust with {
    stardustType @Common.Label : 'stardustCollection/stardustType_ID'
};

