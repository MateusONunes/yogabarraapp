import React from 'react'
import { useNavigation } from '@react-navigation/native';
import { MaterialCommunityIcons } from '@expo/vector-icons'
import { View, Image, Text, TouchableOpacity } from 'react-native'

import styles from './initialstyle'
import img from '../../assets/splash.png'


export default function Initial() {
    const navigation = useNavigation();

    function navigateTo(RouteName) {
        navigation.navigate(RouteName);
    }

    return (
      <View style={styles.container}>
        <Image source= {img} />

        <TouchableOpacity style={styles.enterbox} onPress={() => navigateTo("Student")}>
            <Text style={styles.defaulttext}>Cadastrar Aluno</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.enterbox}>
            <Text style={styles.defaulttext}>Aulas e Preços</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.enterbox}>
            <Text style={styles.defaulttext}>Meus Pagamentos</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.enterbox}>
            <Text style={styles.defaulttext}>Presenças</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.enterbox} onPress={() => navigateTo("Test")}>
            <Text style={styles.defaulttext}>Testes</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.enterbox} onPress={() => navigateTo("Login")}>
            <Text style={styles.defaulttext}>Voltar</Text>
        </TouchableOpacity>


      </View>
  
    )

}
