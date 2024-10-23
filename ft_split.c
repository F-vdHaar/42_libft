/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fvon-der <fvon-der@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/08 20:10:53 by fvon-der          #+#    #+#             */
/*   Updated: 2024/10/08 20:10:55 by fvon-der         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static void	ft_free_memory(char *s);
static int	ft_word_counter(char *s, char c);
static char	*ft_get_word(char *str, char c, int *string_index);

//  - Counts the number of words in the string.
// ** - Allocates memory for an array of strings to hold the split substrings.
// ** - Iterates through the string, 
// extracting each word and storing it in the array.
// ** - Returns the array of split substrings.
char	**ft_split(char const *str, char c)
{
	char	**result;
	int		i;
	int		word_count;
	int		pos;

	if (str == NULL)
		return (NULL);
	i = 0;
	pos = 0;
	word_count = ft_word_counter((char *)str, c);
	result = (char **)malloc(sizeof(char *) * (word_count + 1));
	if (result == NULL)
		return (NULL);
	result[word_count] = NULL;
	while (i < word_count)
	{
		result[i] = ft_get_word(((char *)str), c, &pos);
		if (result[i] == NULL)
		{
			ft_free_memory(result[i]);
		}
		i++;
	}
	return (result);
}

static void	ft_free_memory(char *s)
{
	int	i;

	i = 0;
	while (s[i] != '\0')
	{
		free(s);
		i++;
	}
	free(s);
}

// - Counts the number of words in the string by iterating through it
// **   and identifying word boundaries based on the delimiter character.
static int	ft_word_counter(char *s, char c)
{
	int	i;
	int	word;

	i = 0;
	word = 0;
	while (s[i] != '\0')
	{
		if (s[i] != c)
		{
			word++;
			while (s[i] != c && s[i] != '\0')
				i++;
			if (s[i] == '\0')
				return (word);
		}
		i++;
	}
	return (word);
}

// ** - Extracts a word from the string by
// finding consecutive non-delimiter characters
// **   and copying them into a dynamically allocated memory.
static char	*ft_get_word(char *str, char c, int *str_ind)
{
	char	*word;
	int		j;
	int		start_ind;

	j = *str_ind;
	start_ind = j;
	word = NULL;
	while (str[*str_ind] != '\0')
	{
		if (str[*str_ind] != c)
		{
			while (str[*str_ind] != '\0' && str[*str_ind] != c)
				*str_ind += 1;
			word = (char *)malloc(sizeof(char) * (*str_ind - start_ind + 1));
			if (word == NULL)
				return (NULL);
			ft_strlcpy(word, str + start_ind, *str_ind - start_ind + 1);
			break ;
		}
		*str_ind += 1;
		start_ind++;
	}
	return (word);
}
