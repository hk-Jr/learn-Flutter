import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'ACTIVE USER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      shadows: [Shadow(color: Color(0xFF00F0FF), blurRadius: 8)],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF007F), Color(0xFF00F0FF)],
                  ),
                  boxShadow: [
                    BoxShadow(color: Color(0xFF00F0FF), blurRadius: 10, spreadRadius: 1),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFF16161A),
                  child: Icon(Icons.flash_on_rounded, color: Color(0xFF00F0FF)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Progress Summary Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF007F), Color(0xFF00F0FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF007F).withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today\'s Goal',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '45 mins of cardio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '27 mins completed',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      '60%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'RECOMMENDED EXERCISES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                _buildExerciseCard(
                  context: context,
                  title: 'Push-ups',
                  duration: '10 min',
                  difficulty: 'Medium',
                  icon: Icons.fitness_center_rounded,
                  animationUrl: 'https://media.tenor.com/gI-8qCUEko8AAAAC/pushup.gif',
                  description: 'Get down on all fours, placing your hands slightly wider than your shoulders. Straighten your arms and legs. Lower your body until your chest nearly touches the floor. Pause, then push yourself back up. Repeat.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Sit-ups',
                  duration: '5 min',
                  difficulty: 'Beginner',
                  icon: Icons.airline_seat_recline_normal_rounded,
                  animationUrl: 'https://media.tenor.com/Z4w2u7r-Q4kAAAAC/sit-up.gif',
                  description: 'Lie on your back with bent knees and your feet anchored flat on the floor. Cross your arms across your chest or place your hands behind your head. Brace your core and elevate your upper body toward your knees. Slowly lower yourself down to the starting position. Repeat.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Squats',
                  duration: '8 min',
                  difficulty: 'Beginner',
                  icon: Icons.accessibility_new_rounded,
                  animationUrl: 'https://media.tenor.com/4gTMhsZqD0AAAAAC/squat-workout.gif',
                  description: 'Stand with feet a little wider than shoulder-width apart, hips stacked over knees, and knees over ankles. Roll the shoulders back and down away from the ears. Hinge at the hips and allow the hips to push back as if sitting in a chair, keeping the chest and head up.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Lunges',
                  duration: '10 min',
                  difficulty: 'Medium',
                  icon: Icons.directions_walk_rounded,
                  animationUrl: 'https://media.tenor.com/7wBvJkFwFwQAAAAC/lunge-exercise.gif',
                  description: 'Stand with feet hip-width apart. Take a big step forward with your right leg. Lower your body until your right thigh is parallel to the floor and your right shin is vertical. Push off the right foot to return to the starting position. Repeat on the left side.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Plank',
                  duration: '3 min',
                  difficulty: 'Hard',
                  icon: Icons.sports_gymnastics_rounded,
                  animationUrl: 'https://media.tenor.com/5V3KqR-O14AAAAAC/plank-exercise.gif',
                  description: 'Start on the floor on your hands and knees. Lower your forearms to the floor with elbows positioned under your shoulders and your hands shoulder-width apart. Maintain a straight line from heels through the top of your head, looking down at the floor, with gaze slightly in front of your face.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Burpees',
                  duration: '15 min',
                  difficulty: 'Hard',
                  icon: Icons.local_fire_department_rounded,
                  animationUrl: 'https://media.tenor.com/1G8Vz24cQpAAAAAC/burpee-exercise.gif',
                  description: 'Stand with your feet shoulder-width apart. Lower your body into a squatting position, placing your hands on the floor in front of you. Kick your feet back so that you are in a push-up position. Keep your hands firmly on the ground to support your body. Do one push-up, bring your feet back in, and jump up.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Mountain Climbers',
                  duration: '5 min',
                  difficulty: 'Medium',
                  icon: Icons.terrain_rounded,
                  animationUrl: 'https://media.tenor.com/U16rGqD_B-AAAAAC/mountain-climbers.gif',
                  description: 'Start in a traditional plank — shoulders over hands and weight on just your toes. With your core engaged, bring your right knee forward under your chest, with the toes just off the ground. Return to your basic plank. Switch legs, bringing the left knee forward. Keep switching legs and begin to pick up the pace.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'High Knees',
                  duration: '5 min',
                  difficulty: 'Beginner',
                  icon: Icons.run_circle_outlined,
                  animationUrl: 'https://media.tenor.com/L-z6aB-xG0QAAAAC/high-knees.gif',
                  description: 'Stand with your feet hip-width apart. Lift up your left knee to your chest. Switch to lift your right knee to your chest. Continue the movement, alternating legs and moving at a sprinting or running pace. Keep your core tight and your back straight.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Bicycle Crunches',
                  duration: '8 min',
                  difficulty: 'Medium',
                  icon: Icons.directions_bike_rounded,
                  animationUrl: 'https://media.tenor.com/vH_fQ1T2K4QAAAAC/bicycle-crunch.gif',
                  description: 'Lie flat on the floor with your lower back pressed to the ground. Put your hands behind your head, then bring your knees in towards your chest and lift your shoulder blades off the ground. Straighten your right leg out to about a 45-degree angle to the ground while turning your upper body to the left, bringing your right elbow towards the left knee.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Glute Bridges',
                  duration: '10 min',
                  difficulty: 'Beginner',
                  icon: Icons.sports_martial_arts_rounded,
                  animationUrl: 'https://media.tenor.com/4q-1i53sXKcAAAAC/glute-bridge.gif',
                  description: 'Lie on your back with your hands at your sides, knees bent, and feet flat on the floor under your knees. Tighten your abdominal and buttock muscles by pushing your low back into the ground. Raise your hips to create a straight line from your knees to shoulders. Squeeze your core and pull your belly button back toward your spine.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Russian Twists',
                  duration: '7 min',
                  difficulty: 'Medium',
                  icon: Icons.rotate_right_rounded,
                  animationUrl: 'https://media.tenor.com/uR3V3C8h-QMAAAAC/russian-twist.gif',
                  description: 'Sit on the floor with your knees bent and feet flat on the ground. Lean back slightly so your torso and legs form a V-like shape, bracing your abdominal wall to engage your core. Balancing here, twist your torso from side to side without moving your legs.',
                ),
                const SizedBox(height: 12),
                _buildExerciseCard(
                  context: context,
                  title: 'Wall Sit',
                  duration: '4 min',
                  difficulty: 'Hard',
                  icon: Icons.chair_alt_rounded,
                  animationUrl: 'https://media.tenor.com/4s2H7m-hN5wAAAAC/wall-sit.gif',
                  description: 'Start with your back against a wall with your feet shoulder width and about 2 feet from the wall. Engage your abdominal muscles and slowly slide your back down the wall until your thighs are parallel to the ground. Adjust your feet so your knees are directly above your ankles.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard({
    required BuildContext context,
    required String title,
    required String duration,
    required String difficulty,
    required IconData icon,
    required String animationUrl,
    required String description,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseDetailScreen(
              exerciseName: title,
              animationUrl: animationUrl,
              description: description,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF16161A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF00F0FF).withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00F0FF).withValues(alpha: 0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF00F0FF).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF00F0FF).withValues(alpha: 0.3)),
              ),
              child: Icon(icon, color: const Color(0xFF00F0FF), size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, size: 14, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.bar_chart_rounded, size: 14, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        difficulty,
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: const Color(0xFFFF007F).withValues(alpha: 0.8)),
          ],
        ),
      ),
    );
  }
}
