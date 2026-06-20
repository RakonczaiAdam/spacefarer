sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"spacefarerlist/test/integration/pages/SpacefarerList",
	"spacefarerlist/test/integration/pages/SpacefarerObjectPage"
], function (JourneyRunner, SpacefarerList, SpacefarerObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('spacefarerlist') + '/test/flpSandbox.html#spacefarerlist-tile',
        pages: {
			onTheSpacefarerList: SpacefarerList,
			onTheSpacefarerObjectPage: SpacefarerObjectPage
        },
        async: true
    });

    return runner;
});

