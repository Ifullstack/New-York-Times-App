//
//  Posts+Mock.swift
//  New York Times AppTests
//
//  Created by Cane Allesta on 23/2/22.
//

import Foundation

class PostsMock {
    /// Response from: https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=tS1sD1se3o4f5DFoBvFziaOT6HReRmqN
    static func makePostsJsonMock() -> Data {
        return Data("""
{
    "status": "OK",
    "copyright": "Copyright (c) 2022 The New York Times Company.  All Rights Reserved.",
    "num_results": 20,
    "results": [
        {
            "uri": "nyt://article/ad4c326a-4c65-58cd-a759-8de9feb0df00",
            "url": "https://www.nytimes.com/2022/02/17/arts/television/comedy-jewish-identity.html",
            "id": 100000008145581,
            "asset_id": 100000008145581,
            "source": "New York Times",
            "published_date": "2022-02-17",
            "updated": "2022-02-18 15:23:21",
            "section": "Arts",
            "subsection": "Television",
            "nytdsection": "arts",
            "adx_keywords": "Jews and Judaism;Comedy and Humor;Anti-Semitism;Theater;Television;Movies;audio-neutral-informative;audio-neutral-immersive;Mason, Jackie;Silverman, Sarah",
            "column": null,
            "byline": "By Jason Zinoman",
            "type": "Article",
            "title": "Is It Funny for the Jews?",
            "abstract": "For a cultural critic, a sense of humor is integral to his Jewish identity. But these dark times raise existential questions about comedy and its uses.",
            "des_facet": [
                "Jews and Judaism",
                "Comedy and Humor",
                "Anti-Semitism",
                "Theater",
                "Television",
                "Movies",
                "audio-neutral-informative",
                "audio-neutral-immersive"
            ],
            "org_facet": [],
            "per_facet": [
                "Mason, Jackie",
                "Silverman, Sarah"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Chloe Cushman",
                    "approved_for_syndication": 0,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/arts/20JewishNotebook-Cover/20JewishNotebook-Cover-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/arts/20JewishNotebook-Cover/20JewishNotebook-Cover-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/arts/20JewishNotebook-Cover/20JewishNotebook-Cover-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/0703724a-e813-5cfd-8ead-47f94747db45",
            "url": "https://www.nytimes.com/2022/02/18/style/pickleball-sports.html",
            "id": 100000008197979,
            "asset_id": 100000008197979,
            "source": "New York Times",
            "published_date": "2022-02-18",
            "updated": "2022-02-20 16:01:35",
            "section": "Style",
            "subsection": "",
            "nytdsection": "style",
            "adx_keywords": "Pickleball (Sport);United States",
            "column": null,
            "byline": "By Todd Plummer",
            "type": "Article",
            "title": "Pickleball Is Ready for Prime Time",
            "abstract": "As the sport continues to gain popularity, companies are looking to cash in.",
            "des_facet": [
                "Pickleball (Sport)"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [
                "United States"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Over the last decade, pickleball has grown in popularity as a racquet sport with a lower barrier to entry than tennis.",
                    "copyright": "Maggie Shannon for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/fashion/PICKLEBALL5/PICKLEBALL5-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/fashion/PICKLEBALL5/PICKLEBALL5-mediumThreeByTwo210-v2.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/fashion/PICKLEBALL5/PICKLEBALL5-mediumThreeByTwo440-v2.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/ae43bc28-2da5-51ae-b63f-98f6dee1b69f",
            "url": "https://www.nytimes.com/2022/02/21/health/covid-vaccine-antibodies-t-cells.html",
            "id": 100000008185476,
            "asset_id": 100000008185476,
            "source": "New York Times",
            "published_date": "2022-02-21",
            "updated": "2022-02-23 09:41:16",
            "section": "Health",
            "subsection": "",
            "nytdsection": "health",
            "adx_keywords": "Coronavirus Omicron Variant;Coronavirus (2019-nCoV);Vaccination and Immunization;Immune System;your-feed-healthcare",
            "column": null,
            "byline": "By Apoorva Mandavilli",
            "type": "Article",
            "title": "Got a Covid Booster? You Probably Won’t Need Another for a Long Time",
            "abstract": "A flurry of new studies suggests that several parts of the immune system can mount a sustained, potent response to any coronavirus variant.",
            "des_facet": [
                "Coronavirus Omicron Variant",
                "Coronavirus (2019-nCoV)",
                "Vaccination and Immunization",
                "Immune System",
                "your-feed-healthcare"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "A colored transmission electron micrograph of a T cell. Antibodies are relatively easy to study, whereas analyzing immune cells requires blood, skill, special equipment and lots of time.",
                    "copyright": "Dr. Klaus Boller/Science Source",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/19/science/19-2nd-SUB-VIRUS-IMMUNITY-02-PRINT/09virus-immunity1-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/19/science/19-2nd-SUB-VIRUS-IMMUNITY-02-PRINT/09virus-immunity1-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/19/science/19-2nd-SUB-VIRUS-IMMUNITY-02-PRINT/09virus-immunity1-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/62d893b6-2e50-5436-ab52-fd7ef5fea98d",
            "url": "https://www.nytimes.com/2022/02/14/dining/baking-tricks-tips.html",
            "id": 100000008188145,
            "asset_id": 100000008188145,
            "source": "New York Times",
            "published_date": "2022-02-14",
            "updated": "2022-02-16 22:38:29",
            "section": "Food",
            "subsection": "",
            "nytdsection": "food",
            "adx_keywords": "Bakeries and Baked Products;Cooking and Cookbooks;Content Type: Service;Recipes",
            "column": null,
            "byline": "By Krysten Chambrot",
            "type": "Article",
            "title": "24 Brilliant Baking Recipes to Change Your Kitchen Game",
            "abstract": "These delectable treats are full of light-bulb moments that educate as much as they impress.",
            "des_facet": [
                "Bakeries and Baked Products",
                "Cooking and Cookbooks",
                "Content Type: Service",
                "Recipes"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Christopher Simpson for The New York Times. Food Stylist: Simon Andrews.",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/dining/14brilliantbaking-mochi-cake/merlin_189372024_daa36f69-f001-44db-b790-5b10ea92e9f3-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/dining/14brilliantbaking-mochi-cake/merlin_189372024_daa36f69-f001-44db-b790-5b10ea92e9f3-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/dining/14brilliantbaking-mochi-cake/merlin_189372024_daa36f69-f001-44db-b790-5b10ea92e9f3-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/706e03b6-4b90-5cf7-b441-8b02e99b479d",
            "url": "https://www.nytimes.com/2022/02/15/opinion/blindness-friendship.html",
            "id": 100000008196279,
            "asset_id": 100000008196279,
            "source": "New York Times",
            "published_date": "2022-02-15",
            "updated": "2022-02-18 22:21:41",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "Eyes and Eyesight;Blindness;Chronic Condition (Health);Pain;Disabilities",
            "column": null,
            "byline": "By Frank Bruni",
            "type": "Article",
            "title": "One Day, I Couldn’t See Right. My Life Hasn’t Been the Same Since.",
            "abstract": "The people around me came into sharper focus, by which I mean their fears, struggles and triumphs. ",
            "des_facet": [
                "Eyes and Eyesight",
                "Blindness",
                "Chronic Condition (Health)",
                "Pain",
                "Disabilities"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Hoi Chan",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/opinion/sunday/15bruni/15bruni-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/opinion/sunday/15bruni/15bruni-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/opinion/sunday/15bruni/15bruni-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/cb0b46c2-126c-539b-b423-59edb91234d4",
            "url": "https://www.nytimes.com/2022/02/21/opinion/putin-ukraine-nato.html",
            "id": 100000008221064,
            "asset_id": 100000008221064,
            "source": "New York Times",
            "published_date": "2022-02-21",
            "updated": "2022-02-22 22:17:07",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "War and Armed Conflicts;Cold War Era;United States International Relations;Putin, Vladimir V;North Atlantic Treaty Organization;Ukraine;Russia",
            "column": null,
            "byline": "By Thomas L. Friedman",
            "type": "Article",
            "title": "This Is Putin’s War. But America and NATO Aren’t Innocent Bystanders.",
            "abstract": "Russia’s president is trying to hide his poor leadership by becoming a nationalist avenger.",
            "des_facet": [
                "War and Armed Conflicts",
                "Cold War Era",
                "United States International Relations"
            ],
            "org_facet": [
                "North Atlantic Treaty Organization"
            ],
            "per_facet": [
                "Putin, Vladimir V"
            ],
            "geo_facet": [
                "Ukraine",
                "Russia"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "A member of the Ukrainian Army in Luhansk, a territory in eastern Ukraine that Russia has recognized on Monday as independent.",
                    "copyright": "Tyler Hicks/The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/22/opinion/21friedman1a/21friedman1a-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/22/opinion/21friedman1a/21friedman1a-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/22/opinion/21friedman1a/21friedman1a-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/e63498cf-1e45-55af-84cf-bd51fffb4257",
            "url": "https://www.nytimes.com/2022/02/15/magazine/traveling-nurses.html",
            "id": 100000008202783,
            "asset_id": 100000008202783,
            "source": "New York Times",
            "published_date": "2022-02-15",
            "updated": "2022-02-20 14:39:35",
            "section": "Magazine",
            "subsection": "",
            "nytdsection": "magazine",
            "adx_keywords": "Nursing and Nurses;Shortages;Coronavirus (2019-nCoV);Emergency Medical Treatment;Wages and Salaries;Labor and Jobs;New York City;Texas",
            "column": null,
            "byline": "By Lauren Hilgers",
            "type": "Article",
            "title": "‘Nurses Have Finally Learned What They’re Worth’",
            "abstract": "As the coronavirus spread, demand for nurses came from every corner. Some jobs for travelers paid more than $10,000 a week. Will the boom last?",
            "des_facet": [
                "Nursing and Nurses",
                "Shortages",
                "Coronavirus (2019-nCoV)",
                "Emergency Medical Treatment",
                "Wages and Salaries",
                "Labor and Jobs"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [
                "New York City",
                "Texas"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Kulule Kenea became a traveling nurse in March 2020.",
                    "copyright": "George Etheredge for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/magazine/20mag-Nurses-images-02/20Nurses-images-02-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/magazine/20mag-Nurses-images-02/20Nurses-images-02-mediumThreeByTwo210-v2.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/magazine/20mag-Nurses-images-02/20Nurses-images-02-mediumThreeByTwo440-v2.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/d8a34056-bf95-572f-a46f-f106600a198f",
            "url": "https://www.nytimes.com/2022/02/17/opinion/liberalism-democracy-russia-ukraine.html",
            "id": 100000008214900,
            "asset_id": 100000008214900,
            "source": "New York Times",
            "published_date": "2022-02-17",
            "updated": "2022-02-18 16:04:14",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "Politics and Government;Liberalism (US Politics);Defense and Military Forces;Democracy (Theory and Philosophy);United States Defense and Military Forces;United States International Relations;Constitution (US);International Relations;Nineteen Hundred Nineties;Human Rights and Human Rights Violations;Cold War Era;Putin, Vladimir V;Xi Jinping;Trump, Donald J;Russia;China",
            "column": null,
            "byline": "By David Brooks",
            "type": "Article",
            "title": "The Dark Century",
            "abstract": "Why our era has grown so ugly.",
            "des_facet": [
                "Politics and Government",
                "Liberalism (US Politics)",
                "Defense and Military Forces",
                "Democracy (Theory and Philosophy)",
                "United States Defense and Military Forces",
                "United States International Relations",
                "Constitution (US)",
                "International Relations",
                "Nineteen Hundred Nineties",
                "Human Rights and Human Rights Violations",
                "Cold War Era"
            ],
            "org_facet": [],
            "per_facet": [
                "Putin, Vladimir V",
                "Xi Jinping",
                "Trump, Donald J"
            ],
            "geo_facet": [
                "Russia",
                "China"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Desiree Martin/Agence France-Presse — Getty Images",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/18/opinion/17brooks1/17brooks1-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/18/opinion/17brooks1/17brooks1-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/18/opinion/17brooks1/17brooks1-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/446e5abc-5aa6-5c0a-a3e6-b86252e01781",
            "url": "https://www.nytimes.com/2022/02/15/well/live/burnout-work-stress.html",
            "id": 100000008195616,
            "asset_id": 100000008195616,
            "source": "New York Times",
            "published_date": "2022-02-15",
            "updated": "2022-02-18 12:55:18",
            "section": "Well",
            "subsection": "Live",
            "nytdsection": "well",
            "adx_keywords": "Anxiety and Stress;Mental Health and Disorders;Content Type: Service;Sleep;Labor and Jobs;Psychology and Psychologists",
            "column": null,
            "byline": "By Melinda Wenner Moyer",
            "type": "Article",
            "title": "Your Body Knows You’re Burned Out",
            "abstract": "Here’s how to recognize the physical symptoms of work-related stress — and what to do about them.",
            "des_facet": [
                "Anxiety and Stress",
                "Mental Health and Disorders",
                "Content Type: Service",
                "Sleep",
                "Labor and Jobs",
                "Psychology and Psychologists"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Alva Skog",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/well/00well-body-burnout/00well-body-burnout-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/well/00well-body-burnout/00well-body-burnout-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/well/00well-body-burnout/00well-body-burnout-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/8c070942-f74d-57cd-b24c-907b2adbe133",
            "url": "https://www.nytimes.com/2022/02/14/style/anna-delvey-sorokin-interview.html",
            "id": 100000008205520,
            "asset_id": 100000008205520,
            "source": "New York Times",
            "published_date": "2022-02-14",
            "updated": "2022-02-17 10:58:54",
            "section": "Style",
            "subsection": "",
            "nytdsection": "style",
            "adx_keywords": "Content Type: Personal Profile;Television;Frauds and Swindling;Sorokin, Anna (Anna Delvey)",
            "column": null,
            "byline": "By Emily Palmer",
            "type": "Article",
            "title": "Anna Sorokin on ‘Inventing Anna’ and Life After Rikers",
            "abstract": "In an interview ahead of the Netflix show’s release, Ms. Sorokin spoke about how her life has changed since the end of her Anna Delvey days.",
            "des_facet": [
                "Content Type: Personal Profile",
                "Television",
                "Frauds and Swindling"
            ],
            "org_facet": [],
            "per_facet": [
                "Sorokin, Anna (Anna Delvey)"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Anna Sorokin in 2019, during her trial in Manhattan. She has spent the last year in ICE detention.",
                    "copyright": "Jefferson Siegel for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/17/fashion/14SOROKIN1/14SOROKIN1-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/17/fashion/14SOROKIN1/14SOROKIN1-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/17/fashion/14SOROKIN1/14SOROKIN1-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/33527384-ad7f-5f77-a1b9-1b6404ff5ff1",
            "url": "https://www.nytimes.com/2022/02/15/upshot/homes-garage-door-shortage.html",
            "id": 100000008198575,
            "asset_id": 100000008198575,
            "source": "New York Times",
            "published_date": "2022-02-15",
            "updated": "2022-02-17 11:43:59",
            "section": "The Upshot",
            "subsection": "",
            "nytdsection": "the upshot",
            "adx_keywords": "Real Estate and Housing (Residential);Garages (Residential);Supply Chain;Building (Construction);International Trade and World Market;Home Repairs and Improvements;United States",
            "column": null,
            "byline": "By Emily Badger and Andri Tambunan",
            "type": "Article",
            "title": "4 Bed, 3 Bath, No Garage Door: The Unlikely Woes Holding Up Home Building",
            "abstract": "Supply-chain complications are giving the industry and buyers fits.",
            "des_facet": [
                "Real Estate and Housing (Residential)",
                "Garages (Residential)",
                "Supply Chain",
                "Building (Construction)",
                "International Trade and World Market",
                "Home Repairs and Improvements"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [
                "United States"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Plywood was used to seal the garage of a new home, right, in Sacramento.",
                    "copyright": "Andri Tambunan for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/09/business/00up-garagedoors-04/merlin_201700449_b6ec05a1-57ca-4526-98d2-34c80c58d8ad-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/09/business/00up-garagedoors-04/merlin_201700449_b6ec05a1-57ca-4526-98d2-34c80c58d8ad-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/09/business/00up-garagedoors-04/merlin_201700449_b6ec05a1-57ca-4526-98d2-34c80c58d8ad-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/217d5703-9447-5b2b-a86e-1ef1c459c85c",
            "url": "https://www.nytimes.com/2022/02/15/travel/trends-spring-2022.html",
            "id": 100000008199739,
            "asset_id": 100000008199739,
            "source": "New York Times",
            "published_date": "2022-02-15",
            "updated": "2022-02-15 09:33:35",
            "section": "Travel",
            "subsection": "",
            "nytdsection": "travel",
            "adx_keywords": "Travel and Vacations;Coronavirus Reopenings;Airlines and Airplanes;Hotels and Travel Lodgings;Cruises;Spring (Season);Automobile Renting and Leasing",
            "column": null,
            "byline": "By The New York Times",
            "type": "Article",
            "title": "Travel’s Theme for 2022? ‘Go Big’",
            "abstract": "With Omicron cases ebbing, the industry is looking for a significant rebound in spring and summer. Here’s what to expect, in the air, at the rental car counter and beyond.",
            "des_facet": [
                "Travel and Vacations",
                "Coronavirus Reopenings",
                "Airlines and Airplanes",
                "Hotels and Travel Lodgings",
                "Cruises",
                "Spring (Season)",
                "Automobile Renting and Leasing"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/3799097a-b4c1-5120-8099-728916330d52",
            "url": "https://www.nytimes.com/2017/11/15/well/family/why-your-grumpy-teenager-doesnt-want-to-talk-to-you.html",
            "id": 100000005542239,
            "asset_id": 100000005542239,
            "source": "New York Times",
            "published_date": "2017-11-15",
            "updated": "2017-11-15 06:00:01",
            "section": "Well",
            "subsection": "Family",
            "nytdsection": "well",
            "adx_keywords": "Teenagers and Adolescence;Parenting;Psychology and Psychologists;Families and Family Life",
            "column": null,
            "byline": "By Lisa Damour",
            "type": "Article",
            "title": "Why Your Grumpy Teenager Doesn’t Want to Talk to You",
            "abstract": "It’s hard to help the obviously upset adolescent who turns down a warm invitation to talk. Here’s what may be going on.",
            "des_facet": [
                "Teenagers and Adolescence",
                "Parenting",
                "Psychology and Psychologists",
                "Families and Family Life"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "iStock",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2017/11/08/well/family/well-fam-damour/well-fam-damour-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2017/11/08/well/family/well-fam-damour/well-fam-damour-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2017/11/08/well/family/well-fam-damour/well-fam-damour-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/6b905fed-a171-5399-8d31-89691c1add18",
            "url": "https://www.nytimes.com/2022/02/19/opinion/democrats-biden-voters.html",
            "id": 100000008218240,
            "asset_id": 100000008218240,
            "source": "New York Times",
            "published_date": "2022-02-19",
            "updated": "2022-02-20 16:13:16",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "United States Politics and Government;Biden, Joseph R Jr;Axelrod, David;Carville, James;Greenberg, Stanley B;Democratic Party",
            "column": null,
            "byline": "By Maureen Dowd",
            "type": "Article",
            "title": "Can Dems Dodge Doomsday?",
            "abstract": "Democratic gurus warn party to get real, real fast.",
            "des_facet": [
                "United States Politics and Government"
            ],
            "org_facet": [
                "Democratic Party"
            ],
            "per_facet": [
                "Biden, Joseph R Jr",
                "Axelrod, David",
                "Carville, James",
                "Greenberg, Stanley B"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "President Biden.",
                    "copyright": "Al Drago for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/19/opinion/19Dowd/19Dowd-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/19/opinion/19Dowd/19Dowd-mediumThreeByTwo210-v4.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/19/opinion/19Dowd/19Dowd-mediumThreeByTwo440-v4.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/0b840703-5849-5864-b58c-cb7004d8ecc5",
            "url": "https://www.nytimes.com/2022/02/20/opinion/reading-grief.html",
            "id": 100000008218253,
            "asset_id": 100000008218253,
            "source": "New York Times",
            "published_date": "2022-02-20",
            "updated": "2022-02-22 18:10:27",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "internal-sub-only-nl;Grief (Emotion);Books and Literature;Anxiety and Stress;Quarantine (Life and Culture);Writing and Writers",
            "column": null,
            "byline": "By Tish Harrison Warren",
            "type": "Article",
            "title": "Grief Stole My Love of Reading. Here’s How I Got It Back.",
            "abstract": "I could open a book and stare at its pages. But I couldn’t concentrate.",
            "des_facet": [
                "internal-sub-only-nl",
                "Grief (Emotion)",
                "Books and Literature",
                "Anxiety and Stress",
                "Quarantine (Life and Culture)",
                "Writing and Writers"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Matija Medved",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/opinion/20warren-image/20warren-image-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/opinion/20warren-image/20warren-image-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/20/opinion/20warren-image/20warren-image-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/44aeb7be-045f-5793-94dd-50cb04c987ad",
            "url": "https://www.nytimes.com/2022/02/04/opinion/evangelicalism-division-renewal.html",
            "id": 100000008177243,
            "asset_id": 100000008177243,
            "source": "New York Times",
            "published_date": "2022-02-04",
            "updated": "2022-02-07 12:08:24",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "Evangelical Movement;Christians and Christianity;Race and Ethnicity;Sex Crimes;United States Politics and Government;Trump, Donald J;United States",
            "column": null,
            "byline": "By David Brooks",
            "type": "Article",
            "title": "The Dissenters Trying to Save Evangelicalism From Itself",
            "abstract": "Heartbroken by the path their church has taken, they seek a renewal.",
            "des_facet": [
                "Evangelical Movement",
                "Christians and Christianity",
                "Race and Ethnicity",
                "Sex Crimes",
                "United States Politics and Government"
            ],
            "org_facet": [],
            "per_facet": [
                "Trump, Donald J"
            ],
            "geo_facet": [
                "United States"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Concept by Jason Sfetko, Illustration by Justin Metz",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/06/opinion/sunday/03Brooks/03Brooks-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/06/opinion/sunday/03Brooks/03Brooks-mediumThreeByTwo210-v3.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/06/opinion/sunday/03Brooks/03Brooks-mediumThreeByTwo440-v3.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/51b9914a-7a2e-550d-be23-c5ef79241fc5",
            "url": "https://www.nytimes.com/2022/02/20/business/credit-suisse-leak-swiss-bank.html",
            "id": 100000008212994,
            "asset_id": 100000008212994,
            "source": "New York Times",
            "published_date": "2022-02-20",
            "updated": "2022-02-22 12:34:15",
            "section": "Business",
            "subsection": "",
            "nytdsection": "business",
            "adx_keywords": "Banking and Financial Institutions;Tax Evasion;Money Laundering;High Net Worth Individuals;Corruption (Institutional);Whistle-Blowers;Abdullah II, King of Jordan;Mubarak, Hosni;Credit Suisse Group AG;Switzerland",
            "column": null,
            "byline": "By Jesse Drucker and Ben Hubbard",
            "type": "Article",
            "title": "Vast Leak Exposes How Credit Suisse Served Strongmen and Spies",
            "abstract": "Leaked data on more than 18,000 accounts shows that the Swiss bank missed or ignored red flags.",
            "des_facet": [
                "Banking and Financial Institutions",
                "Tax Evasion",
                "Money Laundering",
                "High Net Worth Individuals",
                "Corruption (Institutional)",
                "Whistle-Blowers"
            ],
            "org_facet": [
                "Credit Suisse Group AG"
            ],
            "per_facet": [
                "Abdullah II, King of Jordan",
                "Mubarak, Hosni"
            ],
            "geo_facet": [
                "Switzerland"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Bloomberg",
                    "approved_for_syndication": 0,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/17/business/00BankLeak-promo/00BankLeak-promo-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/17/business/00BankLeak-promo/00BankLeak-promo-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/17/business/00BankLeak-promo/00BankLeak-promo-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/242553e6-bf0c-5ae1-93a7-40246e5df18f",
            "url": "https://www.nytimes.com/2022/02/13/world/organic-cotton-fraud-india.html",
            "id": 100000008105279,
            "asset_id": 100000008105279,
            "source": "New York Times",
            "published_date": "2022-02-13",
            "updated": "2022-02-17 09:16:37",
            "section": "World",
            "subsection": "",
            "nytdsection": "world",
            "adx_keywords": "Organic Foods and Products;Textiles;Cotton;Agriculture and Farming;Fashion and Apparel;Frauds and Swindling;Supply Chain;bioRe Foundation;Eileen Fisher Inc;Tommy Hilfiger Corp;Global Organic Textile Standard (GOTS);Textile Exchange;India;Madhya Pradesh (India)",
            "column": null,
            "byline": "By Alden Wicker, Emily Schmall, Suhasini Raj and Elizabeth Paton",
            "type": "Article",
            "title": "That Organic Cotton T-Shirt May Not Be as Organic as You Think",
            "abstract": "The organic cotton movement in India appears to be booming, but much of this growth is fake, say those who source, process and grow the cotton.",
            "des_facet": [
                "Organic Foods and Products",
                "Textiles",
                "Cotton",
                "Agriculture and Farming",
                "Fashion and Apparel",
                "Frauds and Swindling",
                "Supply Chain"
            ],
            "org_facet": [
                "bioRe Foundation",
                "Eileen Fisher Inc",
                "Tommy Hilfiger Corp",
                "Global Organic Textile Standard (GOTS)",
                "Textile Exchange"
            ],
            "per_facet": [],
            "geo_facet": [
                "India",
                "Madhya Pradesh (India)"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Harvested organic cotton at a bioRe facility in Kasrawad, India. India is the single largest producer of the world’s organic cotton, responsible for half of the supply.",
                    "copyright": "Saumya Khandelwal for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/business/xxindia-cotton-1/xxindia-cotton-1-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/business/xxindia-cotton-1/xxindia-cotton-1-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/business/xxindia-cotton-1/xxindia-cotton-1-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/e965901f-bdfc-5d79-828b-4b06e2ad42ac",
            "url": "https://www.nytimes.com/2022/02/12/arts/television/inventing-anna-true-story.html",
            "id": 100000008198524,
            "asset_id": 100000008198524,
            "source": "New York Times",
            "published_date": "2022-02-12",
            "updated": "2022-02-18 10:55:09",
            "section": "Arts",
            "subsection": "Television",
            "nytdsection": "arts",
            "adx_keywords": "Television;Frauds and Swindling;News and News Media;Sorokin, Anna (Anna Delvey);Pressler, Jessica;Chlumsky, Anna;Rhimes, Shonda;Garner, Julia (1994- )",
            "column": null,
            "byline": "By Emily Palmer",
            "type": "Article",
            "title": "Seen ‘Inventing Anna’? Here’s What It Gets Right (and Wrong)",
            "abstract": "A reporter who has followed the scammer Anna Sorokin, a.k.a. Anna Delvey, for years watched the new Netflix series about the scandal. The reporter has thoughts.",
            "des_facet": [
                "Television",
                "Frauds and Swindling",
                "News and News Media"
            ],
            "org_facet": [],
            "per_facet": [
                "Sorokin, Anna (Anna Delvey)",
                "Pressler, Jessica",
                "Chlumsky, Anna",
                "Rhimes, Shonda",
                "Garner, Julia (1994- )"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Julia Garner plays the con artist Anna Sorokin, better known as Anna Delvey, in the Netflix series “Inventing Anna,” created by Shonda Rhimes.",
                    "copyright": "Aaron Epstein/Netflix",
                    "approved_for_syndication": 0,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/arts/14INVENTING-ANNA1-sub/14INVENTING-ANNA1-sub-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/arts/14INVENTING-ANNA1-sub/merlin_199964208_63fdc43c-07dc-4864-b70f-1be525f1cdb6-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/14/arts/14INVENTING-ANNA1-sub/merlin_199964208_63fdc43c-07dc-4864-b70f-1be525f1cdb6-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/cb7d67b6-6f78-5019-98a4-237cf37bb94b",
            "url": "https://www.nytimes.com/2022/02/16/opinion/ottawa-truckers-trump.html",
            "id": 100000008207831,
            "asset_id": 100000008207831,
            "source": "New York Times",
            "published_date": "2022-02-16",
            "updated": "2022-02-17 10:39:19",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "Right-Wing Extremism and Alt-Right;Demonstrations, Protests and Riots;Trucks and Trucking;United States Economy;United States Politics and Government;Trump, Donald J;Republican Party;Ottawa (Ontario)",
            "column": null,
            "byline": "By Thomas B. Edsall",
            "type": "Article",
            "title": "There’s a Reason Trump Loves the Truckers",
            "abstract": "Populist nationalism may emphasize the importance of borders, but it still transcends them.",
            "des_facet": [
                "Right-Wing Extremism and Alt-Right",
                "Demonstrations, Protests and Riots",
                "Trucks and Trucking",
                "United States Economy",
                "United States Politics and Government"
            ],
            "org_facet": [
                "Republican Party"
            ],
            "per_facet": [
                "Trump, Donald J"
            ],
            "geo_facet": [
                "Ottawa (Ontario)"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Jason Redmond/Agence France-Presse — Getty Images",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2022/02/16/multimedia/16edsall_3/16edsall_3-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/16/multimedia/16edsall_3/16edsall_3-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2022/02/16/multimedia/16edsall_3/16edsall_3-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        }
    ]
}
""".utf8)
    }

    static func makePostsEmptyResultJsonMock() -> Data {
        return Data("""
{
    "status": "OK",
    "copyright": "Copyright (c) 2022 The New York Times Company.  All Rights Reserved.",
    "num_results": 20
}
""".utf8)
    }
}
