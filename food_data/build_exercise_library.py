"""
Generates exercise library JSON for Firestore seeding.
Run: python build_exercise_library.py > exercises.json
"""
import json


def build_exercises():
    exercises = []

    chest = [
        {
            "name": "Barbell Bench Press",
            "nameAr": "بنش برس بار",
            "difficulty": "intermediate",
            "equipment": ["barbell", "bench"],
            "instructions": [
                "Lie flat on bench, feet planted on floor",
                "Grip barbell at shoulder width, wrists straight",
                "Unrack the bar and lower to mid-chest",
                "Press bar up until arms are fully extended"
            ],
            "commonMistakes": [
                "Bouncing bar off chest",
                "Flaring elbows at 90 degrees",
                "Lifting hips off the bench"
            ]
        },
        {
            "name": "Dumbbell Fly",
            "nameAr": "دمبل فلاي",
            "difficulty": "intermediate",
            "equipment": ["dumbbells", "bench"],
            "instructions": [
                "Lie flat on bench, hold dumbbells above chest with arms extended",
                "Slight bend in elbows throughout movement",
                "Lower arms out to sides in a wide arc until chest stretches",
                "Squeeze chest to bring dumbbells back together"
            ],
            "commonMistakes": [
                "Overextending and straining shoulders",
                "Using too much weight leading to poor form"
            ]
        },
        {
            "name": "Push Up",
            "nameAr": "تمارين الضغط",
            "difficulty": "beginner",
            "equipment": ["bodyweight"],
            "instructions": [
                "Start in plank position, hands shoulder-width apart",
                "Keep body straight from head to heels",
                "Lower chest toward the floor by bending elbows",
                "Push back up to starting position"
            ],
            "commonMistakes": [
                "Sagging hips or raising butt too high",
                "Flaring elbows too wide"
            ]
        },
        {
            "name": "Incline Bench Press",
            "nameAr": "بنش برس إنكلين",
            "difficulty": "intermediate",
            "equipment": ["barbell", "bench"],
            "instructions": [
                "Set bench at 30-45 degree incline",
                "Grip barbell at shoulder width",
                "Lower bar to upper chest",
                "Press up and back to starting position"
            ],
            "commonMistakes": [
                "Too steep an incline shifting focus to shoulders",
                "Bouncing bar off chest"
            ]
        },
        {
            "name": "Decline Bench Press",
            "nameAr": "بنش برس ديكلاين",
            "difficulty": "intermediate",
            "equipment": ["barbell", "bench"],
            "instructions": [
                "Secure feet under pads on decline bench",
                "Grip barbell slightly wider than shoulder width",
                "Lower bar to lower chest",
                "Press bar up to lockout"
            ],
            "commonMistakes": [
                "Letting bar drift too low toward stomach",
                "Not controlling descent"
            ]
        },
        {
            "name": "Cable Crossover",
            "nameAr": "كيبل كروس أوفر",
            "difficulty": "intermediate",
            "equipment": ["cable machine"],
            "instructions": [
                "Set pulleys at high position, stand in center",
                "Grab handles with palms facing forward",
                "Lean slightly forward and bring hands together in front of chest",
                "Slowly return to starting position"
            ],
            "commonMistakes": [
                "Leaning too far forward using body momentum",
                "Not squeezing at the contraction point"
            ]
        },
        {
            "name": "Dumbbell Bench Press",
            "nameAr": "دمبل بنش برس",
            "difficulty": "intermediate",
            "equipment": ["dumbbells", "bench"],
            "instructions": [
                "Lie flat on bench holding dumbbells above chest",
                "Lower dumbbells to sides of chest keeping elbows at 45 degrees",
                "Press dumbbells back up to starting position"
            ],
            "commonMistakes": [
                "Bringing elbows too low causing shoulder strain",
                "Uneven pressing on both sides"
            ]
        },
        {
            "name": "Machine Chest Press",
            "nameAr": "جهاز ضغط صدر",
            "difficulty": "beginner",
            "equipment": ["chest press machine"],
            "instructions": [
                "Adjust seat so handles are at mid-chest level",
                "Grip handles and press forward until arms extend",
                "Slowly return to start"
            ],
            "commonMistakes": [
                "Using momentum rather than controlled movement",
                "Not adjusting seat properly"
            ]
        },
        {
            "name": "Pec Deck Fly",
            "nameAr": "بيك ديك فلاي",
            "difficulty": "beginner",
            "equipment": ["pec deck machine"],
            "instructions": [
                "Sit with back flat against pad, arms at 90 degrees on pads",
                "Squeeze arms together in front of chest",
                "Slowly open arms back to start"
            ],
            "commonMistakes": [
                "Using arms instead of chest to squeeze",
                "Allowing shoulders to roll forward"
            ]
        },
        {
            "name": "Diamond Push Up",
            "nameAr": "ضغط دايموند",
            "difficulty": "intermediate",
            "equipment": ["bodyweight"],
            "instructions": [
                "Start in plank position with hands together forming a diamond shape",
                "Keep elbows close to body",
                "Lower chest toward hands",
                "Push back up"
            ],
            "commonMistakes": [
                "Hands too far forward or back",
                "Letting hips sag"
            ]
        },
    ]

    back = [
        {
            "name": "Pull Up",
            "nameAr": "سحب لأعلى",
            "difficulty": "intermediate",
            "equipment": ["pull up bar"],
            "instructions": [
                "Grip bar with palms facing away, hands shoulder-width apart",
                "Hang with arms fully extended",
                "Pull yourself up until chin is over the bar",
                "Lower yourself with control"
            ],
            "commonMistakes": [
                "Kipping or using momentum",
                "Not achieving full range of motion"
            ]
        },
        {
            "name": "Deadlift",
            "nameAr": "رفع ميت",
            "difficulty": "advanced",
            "equipment": ["barbell", "weight plates"],
            "instructions": [
                "Stand with feet hip-width apart, bar over mid-foot",
                "Hinge at hips and bend knees to grip bar",
                "Keep back flat, chest up",
                "Drive through heels to stand up with the bar"
            ],
            "commonMistakes": [
                "Rounding the lower back",
                "Jerking the bar off the floor"
            ]
        },
        {
            "name": "Barbell Row",
            "nameAr": "صف بار",
            "difficulty": "intermediate",
            "equipment": ["barbell"],
            "instructions": [
                "Hinge forward with flat back holding barbell with overhand grip",
                "Pull bar to lower ribcage, squeezing shoulder blades",
                "Lower bar with control"
            ],
            "commonMistakes": [
                "Rounding lower back",
                "Using body momentum to swing weight"
            ]
        },
        {
            "name": "Lat Pulldown",
            "nameAr": "سحب علوي",
            "difficulty": "beginner",
            "equipment": ["cable machine with lat pulldown bar"],
            "instructions": [
                "Sit at lat pulldown machine, grip bar wider than shoulder width",
                "Lean back slightly, pull bar down to upper chest",
                "Slowly return bar to starting position"
            ],
            "commonMistakes": [
                "Leaning too far back",
                "Pulling bar behind neck"
            ]
        },
        {
            "name": "Seated Cable Row",
            "nameAr": "صف كيبل جالس",
            "difficulty": "beginner",
            "equipment": ["cable machine with v-grip"],
            "instructions": [
                "Sit at cable row station, place feet on platform",
                "Grip handle and pull toward stomach keeping back straight",
                "Squeeze shoulder blades together, then release"
            ],
            "commonMistakes": [
                "Rounding lower back",
                "Leaning too far forward on release"
            ]
        },
        {
            "name": "Dumbbell Row",
            "nameAr": "صف دمبل",
            "difficulty": "intermediate",
            "equipment": ["dumbbell", "bench"],
            "instructions": [
                "Place one knee and hand on bench, other foot on floor",
                "Hold dumbbell in other hand, arm extended",
                "Pull dumbbell to hip keeping elbow close to body",
                "Lower with control"
            ],
            "commonMistakes": [
                "Rotating torso instead of isolating back",
                "Using too much weight and poor form"
            ]
        },
        {
            "name": "T-Bar Row",
            "nameAr": "تي بار صف",
            "difficulty": "advanced",
            "equipment": ["t-bar row machine", "weight plates"],
            "instructions": [
                "Straddle the bar, hinge forward with flat back",
                "Grip handles and pull bar toward chest",
                "Squeeze back muscles and lower with control"
            ],
            "commonMistakes": [
                "Rounding back under load",
                "Using arms more than back"
            ]
        },
        {
            "name": "Hyperextension",
            "nameAr": "فرط تمديد",
            "difficulty": "beginner",
            "equipment": ["hyperextension bench"],
            "instructions": [
                "Position yourself face down on hyperextension bench",
                "Cross arms over chest, hinge at hips to lower torso",
                "Raise torso until body forms straight line"
            ],
            "commonMistakes": [
                "Overextending at the top",
                "Using momentum instead of controlled movement"
            ]
        },
        {
            "name": "Face Pull",
            "nameAr": "فيس بول",
            "difficulty": "intermediate",
            "equipment": ["cable machine with rope"],
            "instructions": [
                "Set pulley at upper chest height",
                "Grip rope with both hands, step back",
                "Pull rope toward face, separating hands at end",
                "Slowly return"
            ],
            "commonMistakes": [
                "Using too much weight and poor form",
                "Pulling to neck instead of face"
            ]
        },
        {
            "name": "Chin Up",
            "nameAr": "سحب عكسي",
            "difficulty": "intermediate",
            "equipment": ["pull up bar"],
            "instructions": [
                "Grip bar with palms facing toward you, shoulder-width apart",
                "Pull yourself up until chin clears the bar",
                "Lower with control"
            ],
            "commonMistakes": [
                "Using leg kip for momentum",
                "Not achieving full extension at bottom"
            ]
        },
    ]

    shoulders = [
        {
            "name": "Overhead Press",
            "nameAr": "ضغط كتف بالبار",
            "difficulty": "intermediate",
            "equipment": ["barbell"],
            "instructions": [
                "Stand with feet shoulder-width apart, bar at shoulder height",
                "Press bar overhead until arms are fully extended",
                "Lower bar back to shoulders"
            ],
            "commonMistakes": [
                "Arching lower back excessively",
                "Not keeping elbows slightly in front of bar"
            ]
        },
        {
            "name": "Lateral Raise",
            "nameAr": "رفرفة جانبية",
            "difficulty": "beginner",
            "equipment": ["dumbbells"],
            "instructions": [
                "Stand holding dumbbells at sides, slight bend in elbows",
                "Raise arms out to sides until parallel to floor",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Using momentum and swinging body",
                "Raising too high above parallel"
            ]
        },
        {
            "name": "Front Raise",
            "nameAr": "رفرفة أمامية",
            "difficulty": "beginner",
            "equipment": ["dumbbells", "plate"],
            "instructions": [
                "Stand with dumbbells in front of thighs",
                "Raise arms straight forward to shoulder height",
                "Lower with control"
            ],
            "commonMistakes": [
                "Leaning back as weight rises",
                "Using torso momentum"
            ]
        },
        {
            "name": "Reverse Fly",
            "nameAr": "رفرفة خلفية",
            "difficulty": "beginner",
            "equipment": ["dumbbells"],
            "instructions": [
                "Hinge forward with flat back, dumbbells hanging below chest",
                "Raise arms out to sides squeezing shoulder blades",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Rounding the back",
                "Bending elbows too much"
            ]
        },
        {
            "name": "Arnold Press",
            "nameAr": "ضغط أرنولد",
            "difficulty": "intermediate",
            "equipment": ["dumbbells"],
            "instructions": [
                "Sit holding dumbbells in front of shoulders, palms facing you",
                "Press overhead while rotating palms forward",
                "Reverse motion on the way down"
            ],
            "commonMistakes": [
                "Using too much weight leading to poor form",
                "Not rotating fully"
            ]
        },
        {
            "name": "Barbell Shrug",
            "nameAr": "هز كتف بالبار",
            "difficulty": "beginner",
            "equipment": ["barbell"],
            "instructions": [
                "Stand holding barbell at hip level",
                "Shrug shoulders straight up toward ears",
                "Lower with control"
            ],
            "commonMistakes": [
                "Rolling shoulders instead of shrugging straight up",
                "Using arm strength to lift"
            ]
        },
        {
            "name": "Upright Row",
            "nameAr": "صف عمودي",
            "difficulty": "intermediate",
            "equipment": ["barbell", "dumbbells"],
            "instructions": [
                "Stand holding barbell at hip level with overhand grip",
                "Pull bar straight up to chin leading with elbows",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Pulling bar too high causing shoulder impingement",
                "Using too wide a grip"
            ]
        },
        {
            "name": "Machine Shoulder Press",
            "nameAr": "جهاز ضغط كتف",
            "difficulty": "beginner",
            "equipment": ["shoulder press machine"],
            "instructions": [
                "Adjust seat so handles are at shoulder height",
                "Press handles overhead until arms extend",
                "Slowly return"
            ],
            "commonMistakes": [
                "Not adjusting seat properly",
                "Locking elbows at top"
            ]
        },
    ]

    biceps = [
        {
            "name": "Barbell Curl",
            "nameAr": "تمرين العضلة ذات الرأسين بالبار",
            "difficulty": "beginner",
            "equipment": ["barbell"],
            "instructions": [
                "Stand holding barbell with underhand grip, hands shoulder-width apart",
                "Curl bar toward shoulders keeping elbows fixed at sides",
                "Lower bar slowly"
            ],
            "commonMistakes": [
                "Swinging body for momentum",
                "Moving elbows forward during curl"
            ]
        },
        {
            "name": "Dumbbell Curl",
            "nameAr": "دمبل كيرل",
            "difficulty": "beginner",
            "equipment": ["dumbbells"],
            "instructions": [
                "Stand holding dumbbells at sides, palms facing forward",
                "Curl one dumbbell toward shoulder, keeping elbow fixed",
                "Lower and repeat with other arm"
            ],
            "commonMistakes": [
                "Using shoulder to swing weight up",
                "Not fully extending at bottom"
            ]
        },
        {
            "name": "Hammer Curl",
            "nameAr": "هامر كيرل",
            "difficulty": "beginner",
            "equipment": ["dumbbells"],
            "instructions": [
                "Stand with dumbbells at sides, palms facing each other (neutral grip)",
                "Curl dumbbells toward shoulders keeping palms facing in",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Rocking torso for momentum",
                "Supinating wrists during the movement"
            ]
        },
        {
            "name": "Concentration Curl",
            "nameAr": "كونسينتراشن كيرل",
            "difficulty": "intermediate",
            "equipment": ["dumbbell"],
            "instructions": [
                "Sit on bench, legs spread, hold dumbbell in one hand",
                "Rest that arm against inner thigh",
                "Curl dumbbell toward shoulder, squeezing bicep",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Using shoulder to initiate the curl",
                "Swinging the weight"
            ]
        },
        {
            "name": "Preacher Curl",
            "nameAr": "بريتشر كيرل",
            "difficulty": "intermediate",
            "equipment": ["barbell", "preacher bench"],
            "instructions": [
                "Sit at preacher bench with arms resting on pad",
                "Grip bar shoulder-width, curl toward shoulders",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Letting elbows lift off the pad",
                "Using too much weight"
            ]
        },
        {
            "name": "Cable Curl",
            "nameAr": "كيبل كيرل",
            "difficulty": "beginner",
            "equipment": ["cable machine with straight bar"],
            "instructions": [
                "Stand facing cable machine, grip bar at hip level",
                "Curl bar toward shoulders keeping elbows at sides",
                "Lower with control"
            ],
            "commonMistakes": [
                "Moving elbows forward or back",
                "Using body momentum"
            ]
        },
        {
            "name": "Incline Dumbbell Curl",
            "nameAr": "إنكلين دمبل كيرل",
            "difficulty": "intermediate",
            "equipment": ["dumbbells", "bench"],
            "instructions": [
                "Sit on incline bench set at 45 degrees, arms hanging down",
                "With palms facing forward, curl dumbbells toward shoulders",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Swinging arms using momentum",
                "Not controlling the negative"
            ]
        },
        {
            "name": "Zottman Curl",
            "nameAr": "زوتومان كيرل",
            "difficulty": "intermediate",
            "equipment": ["dumbbells"],
            "instructions": [
                "Stand holding dumbbells at sides, palms forward",
                "Curl normally, then rotate palms down at top",
                "Lower with palms facing down, rotate back at bottom"
            ],
            "commonMistakes": [
                "Using too much weight",
                "Not rotating palms properly"
            ]
        },
    ]

    triceps = [
        {
            "name": "Tricep Pushdown",
            "nameAr": "ترايسبس داون",
            "difficulty": "beginner",
            "equipment": ["cable machine with rope"],
            "instructions": [
                "Stand at cable machine with rope attached at high pulley",
                "Grip rope, elbows at 90 degrees tucked to sides",
                "Push rope down until arms are fully extended",
                "Slowly return"
            ],
            "commonMistakes": [
                "Letting elbows flare out",
                "Using upper body to push weight"
            ]
        },
        {
            "name": "Skull Crusher (Lying Tricep Extension)",
            "nameAr": "سكل كروشر",
            "difficulty": "intermediate",
            "equipment": ["barbell", "dumbbells", "bench"],
            "instructions": [
                "Lie on bench holding barbell above chest with arms extended",
                "Lower bar toward forehead by bending elbows only",
                "Extend arms back to starting position"
            ],
            "commonMistakes": [
                "Letting elbows flare out",
                "Lowering bar too fast"
            ]
        },
        {
            "name": "Close Grip Bench Press",
            "nameAr": "بنش برس بقبضة ضيقة",
            "difficulty": "intermediate",
            "equipment": ["barbell", "bench"],
            "instructions": [
                "Lie on bench, grip barbell with hands shoulder-width apart",
                "Lower bar to lower chest, elbows tucked",
                "Press bar up"
            ],
            "commonMistakes": [
                "Grip too narrow causing wrist strain",
                "Flaring elbows"
            ]
        },
        {
            "name": "Overhead Tricep Extension",
            "nameAr": "تمديد ترايسبس خلف الرأس",
            "difficulty": "beginner",
            "equipment": ["dumbbell", "cable machine"],
            "instructions": [
                "Stand or sit holding dumbbell overhead with both hands",
                "Lower dumbbell behind head by bending elbows",
                "Extend arms back overhead"
            ],
            "commonMistakes": [
                "Flaring elbows too wide",
                "Using lower back to push weight"
            ]
        },
        {
            "name": "Tricep Kickback",
            "nameAr": "ترايسبس كيك باك",
            "difficulty": "beginner",
            "equipment": ["dumbbells"],
            "instructions": [
                "Hinge forward with flat back, dumbbells at sides, elbows at 90 degrees",
                "Extend arms straight back squeezing triceps",
                "Return slowly"
            ],
            "commonMistakes": [
                "Using shoulder instead of triceps",
                "Not locking arm at top"
            ]
        },
        {
            "name": "Bench Dip",
            "nameAr": "دايب على بنش",
            "difficulty": "beginner",
            "equipment": ["bench"],
            "instructions": [
                "Place hands on edge of bench, feet on floor or another bench",
                "Lower body by bending elbows to 90 degrees",
                "Push back up"
            ],
            "commonMistakes": [
                "Flaring elbows too wide",
                "Going too deep causing shoulder strain"
            ]
        },
        {
            "name": "Cable Overhead Tricep Extension",
            "nameAr": "كيبل تمديد ترايسبس",
            "difficulty": "beginner",
            "equipment": ["cable machine with rope"],
            "instructions": [
                "Attach rope to low pulley, face away from machine",
                "Hold rope behind head, elbows pointing up",
                "Extend arms overhead"
            ],
            "commonMistakes": [
                "Letting elbows drift forward",
                "Not controlling the negative"
            ]
        },
    ]

    legs = [
        {
            "name": "Barbell Back Squat",
            "nameAr": "قرفصاء بالبار",
            "difficulty": "intermediate",
            "equipment": ["barbell", "squat rack"],
            "instructions": [
                "Position bar on upper back, hands gripping bar",
                "Unrack and step back, feet shoulder-width apart",
                "Lower hips back and down until thighs are parallel to floor",
                "Drive through heels to stand"
            ],
            "commonMistakes": [
                "Knees caving inward",
                "Heels coming off floor",
                "Rounding lower back at bottom"
            ]
        },
        {
            "name": "Leg Press",
            "nameAr": "ضغط أرجل",
            "difficulty": "beginner",
            "equipment": ["leg press machine"],
            "instructions": [
                "Sit on leg press machine, place feet shoulder-width on platform",
                "Release safety and lower platform until knees are at 90 degrees",
                "Press through heels to return"
            ],
            "commonMistakes": [
                "Locking knees at top",
                "Lowering too far causing hips to lift off seat"
            ]
        },
        {
            "name": "Romanian Deadlift",
            "nameAr": "رومانيا ديدليفت",
            "difficulty": "intermediate",
            "equipment": ["barbell", "dumbbells"],
            "instructions": [
                "Stand holding barbell at hip level, feet hip-width apart",
                "Hinge at hips pushing butt back, keeping legs slightly bent",
                "Lower bar along legs until you feel hamstring stretch",
                "Drive hips forward to return to standing"
            ],
            "commonMistakes": [
                "Rounding lower back",
                "Letting bar drift away from legs"
            ]
        },
        {
            "name": "Leg Extension",
            "nameAr": "تمديد أرجل",
            "difficulty": "beginner",
            "equipment": ["leg extension machine"],
            "instructions": [
                "Sit on leg extension machine, pad on top of ankles",
                "Extend legs until fully straight",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Using momentum and swinging",
                "Locking knees aggressively at top"
            ]
        },
        {
            "name": "Leg Curl",
            "nameAr": "ثني أرجل",
            "difficulty": "beginner",
            "equipment": ["leg curl machine"],
            "instructions": [
                "Lie face down on leg curl machine, pad behind ankles",
                "Curl legs toward glutes",
                "Lower slowly"
            ],
            "commonMistakes": [
                "Lifting hips off pad",
                "Using too much weight and jerking"
            ]
        },
        {
            "name": "Walking Lunge",
            "nameAr": "اندفاع مشي",
            "difficulty": "beginner",
            "equipment": ["dumbbells"],
            "instructions": [
                "Stand with feet together holding dumbbells at sides",
                "Step forward with one leg, lowering hips until both knees are at 90 degrees",
                "Push off front foot and step forward with opposite leg"
            ],
            "commonMistakes": [
                "Front knee going past toes",
                "Torso leaning too far forward"
            ]
        },
        {
            "name": "Bulgarian Split Squat",
            "nameAr": "بلغاري سبليت سكوات",
            "difficulty": "advanced",
            "equipment": ["dumbbells", "bench"],
            "instructions": [
                "Place one foot on bench behind you, other foot forward",
                "Hold dumbbells at sides",
                "Lower back knee toward floor keeping front knee aligned",
                "Drive through front heel to stand"
            ],
            "commonMistakes": [
                "Front knee collapsing inward",
                "Leaning too far forward"
            ]
        },
        {
            "name": "Hack Squat",
            "nameAr": "هاك سكوات",
            "difficulty": "intermediate",
            "equipment": ["hack squat machine"],
            "instructions": [
                "Position shoulders on pads, feet shoulder-width on platform",
                "Release safeties and lower until thighs are parallel to platform",
                "Drive through heels to return up"
            ],
            "commonMistakes": [
                "Feet too high or low on platform",
                "Knees caving inward"
            ]
        },
        {
            "name": "Standing Calf Raise",
            "nameAr": "رفع سمانة واقف",
            "difficulty": "beginner",
            "equipment": ["calf raise machine"],
            "instructions": [
                "Stand on calf raise machine with shoulders under pads",
                "Lower heels below the step level",
                "Push up onto toes as high as possible"
            ],
            "commonMistakes": [
                "Not achieving full range of motion",
                "Using momentum"
            ]
        },
        {
            "name": "Goblet Squat",
            "nameAr": "جوبلت سكوات",
            "difficulty": "beginner",
            "equipment": ["dumbbell", "kettlebell"],
            "instructions": [
                "Hold dumbbell vertically against chest with both hands",
                "Feet slightly wider than shoulder-width",
                "Lower hips back and down, elbows should touch inside knees at bottom",
                "Drive through heels to stand"
            ],
            "commonMistakes": [
                "Letting knees cave in",
                "Heels lifting off floor"
            ]
        },
        {
            "name": "Front Squat",
            "nameAr": "قرفصاء أمامي",
            "difficulty": "advanced",
            "equipment": ["barbell", "squat rack"],
            "instructions": [
                "Position bar on front shoulders, hands on bar with elbows high",
                "Unrack and step back, feet shoulder-width",
                "Lower into squat keeping torso upright",
                "Drive through heels to stand"
            ],
            "commonMistakes": [
                "Elbows dropping causing bar to roll forward",
                "Knees caving"
            ]
        },
        {
            "name": "Hip Thrust",
            "nameAr": "دفع حوض",
            "difficulty": "intermediate",
            "equipment": ["barbell", "bench"],
            "instructions": [
                "Sit on floor with upper back against bench, barbell over hips",
                "Drive through heels to lift hips until body forms straight line",
                "Squeeze glutes at top, lower with control"
            ],
            "commonMistakes": [
                "Hyperextending lower back at top",
                "Not achieving full hip extension"
            ]
        },
    ]

    abs = [
        {
            "name": "Crunch",
            "nameAr": "تمارين البطن",
            "difficulty": "beginner",
            "equipment": ["bodyweight"],
            "instructions": [
                "Lie on back, knees bent, feet flat, hands behind head",
                "Curl shoulders off floor squeezing abs",
                "Lower with control"
            ],
            "commonMistakes": [
                "Pulling on neck",
                "Using momentum"
            ]
        },
        {
            "name": "Plank",
            "nameAr": "بلانك",
            "difficulty": "beginner",
            "equipment": ["bodyweight"],
            "instructions": [
                "Start on forearms and toes, body in straight line",
                "Engage core and glutes, hold position",
                "Breathe steadily throughout"
            ],
            "commonMistakes": [
                "Sagging hips",
                "Holding breath"
            ]
        },
        {
            "name": "Russian Twist",
            "nameAr": "تويست روسي",
            "difficulty": "beginner",
            "equipment": ["bodyweight", "medicine ball"],
            "instructions": [
                "Sit with knees bent, lean back slightly, hands together in front",
                "Rotate torso to one side, then the other",
                "Keep core engaged throughout"
            ],
            "commonMistakes": [
                "Using arms instead of core to twist",
                "Rounding lower back"
            ]
        },
        {
            "name": "Leg Raise",
            "nameAr": "رفع أرجل",
            "difficulty": "intermediate",
            "equipment": ["bodyweight"],
            "instructions": [
                "Lie flat on back, legs straight, hands under glutes",
                "Raise legs to 90 degrees keeping them straight",
                "Lower slowly without letting feet touch floor"
            ],
            "commonMistakes": [
                "Arching lower back",
                "Using momentum to swing legs"
            ]
        },
        {
            "name": "Cable Crunch",
            "nameAr": "كيبل كرانش",
            "difficulty": "intermediate",
            "equipment": ["cable machine with rope"],
            "instructions": [
                "Kneel facing cable machine, hold rope behind head",
                "Curl torso downward bringing elbows toward knees",
                "Return slowly"
            ],
            "commonMistakes": [
                "Using arms instead of abs",
                "Not curling spine"
            ]
        },
        {
            "name": "Hanging Knee Raise",
            "nameAr": "رفع ركبة معلق",
            "difficulty": "intermediate",
            "equipment": ["pull up bar"],
            "instructions": [
                "Hang from pull up bar with arms fully extended",
                "Raise knees toward chest keeping core engaged",
                "Lower with control"
            ],
            "commonMistakes": [
                "Swinging legs using momentum",
                "Not engaging core"
            ]
        },
        {
            "name": "Ab Roller",
            "nameAr": "أب رولر",
            "difficulty": "intermediate",
            "equipment": ["ab wheel"],
            "instructions": [
                "Kneel on floor holding ab wheel in front of shoulders",
                "Roll forward keeping core tight, extending body",
                "Use abs to pull body back to start"
            ],
            "commonMistakes": [
                "Arching lower back",
                "Not engaging core enough"
            ]
        },
        {
            "name": "Bicycle Crunch",
            "nameAr": "باييسكل كرانش",
            "difficulty": "beginner",
            "equipment": ["bodyweight"],
            "instructions": [
                "Lie on back, hands behind head, legs lifted",
                "Bring one knee toward chest while twisting opposite elbow toward it",
                "Alternate sides in pedaling motion"
            ],
            "commonMistakes": [
                "Pulling on neck",
                "Moving too fast without control"
            ]
        },
    ]

    cardio = [
        {
            "name": "Running",
            "nameAr": "جري",
            "difficulty": "beginner",
            "isCardio": True,
            "equipment": ["treadmill", "outdoor space"],
            "instructions": [
                "Start with 5-minute warm-up walk",
                "Maintain steady pace with upright posture",
                "Land mid-foot and breathe rhythmically"
            ],
            "commonMistakes": [
                "Heel striking too hard",
                "Leaning too far forward"
            ]
        },
        {
            "name": "Cycling",
            "nameAr": "دراجة",
            "difficulty": "beginner",
            "isCardio": True,
            "equipment": ["stationary bike", "bicycle"],
            "instructions": [
                "Adjust seat height so leg is nearly extended at bottom of pedal stroke",
                "Maintain steady cadence, engage core",
                "Breathe steadily throughout"
            ],
            "commonMistakes": [
                "Seat too low causing knee strain",
                "Slouching shoulders"
            ]
        },
        {
            "name": "Jump Rope",
            "nameAr": "نط حبل",
            "difficulty": "intermediate",
            "isCardio": True,
            "equipment": ["jump rope"],
            "instructions": [
                "Hold rope handles at hip level",
                "Swing rope overhead and jump with soft knees",
                "Land lightly on balls of feet"
            ],
            "commonMistakes": [
                "Jumping too high",
                "Flailing arms wide"
            ]
        },
        {
            "name": "Rowing Machine",
            "nameAr": "تجديف",
            "difficulty": "beginner",
            "isCardio": True,
            "equipment": ["rowing machine"],
            "instructions": [
                "Start with legs extended, arms straight, torso upright",
                "Drive with legs, then pull with arms, leaning back slightly",
                "Reverse sequence: arms, torso, legs"
            ],
            "commonMistakes": [
                "Bending arms too early",
                "Rounding lower back"
            ]
        },
        {
            "name": "Burpee",
            "nameAr": "بيربي",
            "difficulty": "intermediate",
            "isCardio": True,
            "equipment": ["bodyweight"],
            "instructions": [
                "Stand then squat down placing hands on floor",
                "Jump feet back into plank position",
                "Jump feet forward and explode up into a jump"
            ],
            "commonMistakes": [
                "Not achieving full plank position",
                "Landing hard on heels"
            ]
        },
        {
            "name": "Mountain Climber",
            "nameAr": "متسلق جبال",
            "difficulty": "beginner",
            "isCardio": True,
            "equipment": ["bodyweight"],
            "instructions": [
                "Start in plank position, hands under shoulders",
                "Drive one knee toward chest, then alternate quickly",
                "Keep hips low and core engaged"
            ],
            "commonMistakes": [
                "Letting hips rise too high",
                "Not bringing knees far enough forward"
            ]
        },
        {
            "name": "Jumping Jack",
            "nameAr": "نط واسع",
            "difficulty": "beginner",
            "isCardio": True,
            "equipment": ["bodyweight"],
            "instructions": [
                "Stand with feet together, arms at sides",
                "Jump feet out while raising arms overhead",
                "Jump back to starting position"
            ],
            "commonMistakes": [
                "Not landing softly",
                "Lack of rhythm"
            ]
        },
        {
            "name": "Stair Climber",
            "nameAr": "سلم كهربائي",
            "difficulty": "beginner",
            "isCardio": True,
            "equipment": ["stair climber machine"],
            "instructions": [
                "Step onto machine, start at comfortable pace",
                "Maintain upright posture, hold rails lightly for balance",
                "Take full steps without bouncing"
            ],
            "commonMistakes": [
                "Leaning heavily on handrails",
                "Taking too short steps"
            ]
        },
    ]

    muscle_groups = {
        "chest": chest,
        "back": back,
        "shoulders": shoulders,
        "biceps": biceps,
        "triceps": triceps,
        "legs": legs,
        "abs": abs,
        "cardio": cardio
    }

    for muscle_group, exs in muscle_groups.items():
        for i, ex in enumerate(exs):
            ex['id'] = f"{muscle_group}_{i + 1:02d}"
            ex['muscleGroup'] = muscle_group
            ex['muscleGroupAr'] = muscle_group
            if 'isCardio' not in ex:
                ex['isCardio'] = False
            if 'instructions' not in ex or not ex['instructions']:
                ex['instructions'] = [
                    "Perform the exercise with proper form",
                    "Control the movement throughout",
                    "Breathe steadily"
                ]
            if 'commonMistakes' not in ex or not ex['commonMistakes']:
                ex['commonMistakes'] = [
                    "Using too much weight",
                    "Poor form"
                ]
            if 'equipment' not in ex or not ex['equipment']:
                ex['equipment'] = ["bodyweight"]
            ex['imageUrl'] = f"assets/exercises/{muscle_group}/{i + 1:02d}.png"
            ex['searchKeywords'] = [ex['name'].lower(), ex.get('nameAr', '').lower()]
            exercises.append(ex)

    return exercises


if __name__ == '__main__':
    exercises = build_exercises()
    with open('exercises.json', 'w', encoding='utf-8') as f:
        json.dump(exercises, f, indent=2, ensure_ascii=False)
    print(f"Generated {len(exercises)} exercises")
