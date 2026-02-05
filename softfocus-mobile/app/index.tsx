import { View, Text, StyleSheet } from 'react-native';

export default function ResultScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>
        SoftFocus Mobile — OK
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: 24,
  },
  title: {
    fontSize: 18,
    fontWeight: '400',
    color: '#000000',
    textAlign: 'center',
  },
});
